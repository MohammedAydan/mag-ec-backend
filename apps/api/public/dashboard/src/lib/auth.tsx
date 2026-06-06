/* eslint-disable react-refresh/only-export-components */
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useRef,
  useState,
  type ReactNode,
} from 'react';
import { ApiRequestError, publicRequest, tokenRequest } from './http';

const SESSION_KEY = 'atelier.admin.session';
const MAX_LOGIN_ATTEMPTS = 5;
const LOGIN_COOLDOWN_MS = 30_000;
const SESSION_MAX_AGE_MS = 8 * 60 * 60 * 1000;

export interface AdminProfile {
  id: string;
  email: string;
  displayName: string;
  userType: string;
  status: string;
  roles: Array<{ id?: string; name?: string; key?: string }>;
}

interface TokenResponse {
  accessToken: string;
  refreshToken: string;
  user?: AdminProfile;
}

interface StoredSession {
  accessToken: string;
  refreshToken?: string;
  fingerprint: string;
  createdAt: number;
}

interface AuthState {
  session: StoredSession | null;
  user: AdminProfile | null;
  isLoading: boolean;
  isAuthenticated: boolean;
}

interface AuthContextValue extends AuthState {
  login: (email: string, password: string) => Promise<void>;
  logout: () => Promise<void>;
  request: <T>(path: string, init?: RequestInit & { anonymous?: boolean }) => Promise<T>;
}

const AuthContext = createContext<AuthContextValue | null>(null);

function buildFingerprint(): string {
  const components = [
    navigator.userAgent,
    navigator.language,
    screen.colorDepth,
    screen.width,
    screen.height,
    new Date().getTimezoneOffset(),
  ];
  return btoa(components.join('|')).slice(0, 32);
}

function loadSession(): StoredSession | null {
  try {
    const raw = sessionStorage.getItem(SESSION_KEY);
    if (!raw) return null;
    const session = JSON.parse(raw) as StoredSession;
    if (!session?.accessToken || !session?.fingerprint || !session?.createdAt) return null;
    if (session.fingerprint !== buildFingerprint()) return null;
    if (Date.now() - session.createdAt > SESSION_MAX_AGE_MS) return null;
    return session;
  } catch {
    return null;
  }
}

function saveSession(session: StoredSession | null): void {
  if (session) sessionStorage.setItem(SESSION_KEY, JSON.stringify(session));
  else sessionStorage.removeItem(SESSION_KEY);
}

function isAdmin(user: Pick<AdminProfile, 'userType'>): boolean {
  return user.userType === 'ADMIN';
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<AuthState>({
    session: loadSession(),
    user: null,
    isLoading: true,
    isAuthenticated: false,
  });
  const refreshInFlight = useRef<Promise<StoredSession> | null>(null);
  const loginAttempts = useRef<number>(0);
  const lastLoginAttempt = useRef<number>(0);

  const clearSession = useCallback(() => {
    saveSession(null);
    refreshInFlight.current = null;
    setState({ session: null, user: null, isLoading: false, isAuthenticated: false });
  }, []);

  const refreshTokens = useCallback(async (session: StoredSession): Promise<StoredSession> => {
    if (!session.refreshToken) throw new Error('Session expired. Please sign in again.');

    if (refreshInFlight.current) {
      return refreshInFlight.current;
    }

    refreshInFlight.current = (async () => {
      const refreshed = await publicRequest<TokenResponse>('/auth/refresh', {
        method: 'POST',
        body: JSON.stringify({ refreshToken: session.refreshToken }),
      });

      const next: StoredSession = {
        accessToken: refreshed.accessToken,
        refreshToken: refreshed.refreshToken ?? session.refreshToken,
        fingerprint: session.fingerprint,
        createdAt: Date.now(),
      };

      saveSession(next);
      setState((current) => ({ ...current, session: next }));
      return next;
    })();

    try {
      return await refreshInFlight.current;
    } finally {
      refreshInFlight.current = null;
    }
  }, []);

  const request = useCallback(
    async <T,>(path: string, init: RequestInit & { anonymous?: boolean } = {}): Promise<T> => {
      const { anonymous, ...options } = init;
      if (anonymous) return publicRequest<T>(path, options);

      const active = state.session;
      if (!active?.accessToken) throw new Error('Administrator session is required.');

      try {
        return await tokenRequest<T>(path, active.accessToken, options);
      } catch (error) {
        if (!(error instanceof ApiRequestError) || error.statusCode !== 401 || !active.refreshToken) {
          throw error;
        }

        try {
          const refreshed = await refreshTokens(active);
          return await tokenRequest<T>(path, refreshed.accessToken, options);
        } catch {
          clearSession();
          throw new ApiRequestError({
            message: 'Your session has expired. Please sign in again.',
            code: 'SESSION_EXPIRED',
            statusCode: 401,
          });
        }
      }
    },
    [clearSession, refreshTokens, state.session],
  );

  useEffect(() => {
    const boot = async () => {
      if (!state.session?.accessToken) {
        setState((current) => ({ ...current, isLoading: false }));
        return;
      }

      try {
        const profile = await tokenRequest<AdminProfile>('/auth/me', state.session.accessToken);
        if (!isAdmin(profile)) throw new Error('Administrator access is required.');

        setState((current) => ({
          ...current,
          user: profile,
          isLoading: false,
          isAuthenticated: true,
        }));
      } catch {
        clearSession();
      }
    };

    void boot();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const login = useCallback(async (email: string, password: string) => {
    const now = Date.now();

    if (loginAttempts.current >= MAX_LOGIN_ATTEMPTS && now - lastLoginAttempt.current < LOGIN_COOLDOWN_MS) {
      const waitSeconds = Math.ceil((LOGIN_COOLDOWN_MS - (now - lastLoginAttempt.current)) / 1000);
      throw new Error(`Too many login attempts. Please wait ${waitSeconds} seconds before trying again.`);
    }

    if (now - lastLoginAttempt.current > LOGIN_COOLDOWN_MS) {
      loginAttempts.current = 0;
    }

    try {
      const session = await publicRequest<TokenResponse>('/auth/login', {
        method: 'POST',
        body: JSON.stringify({ email, password }),
      });

      loginAttempts.current = 0;
      lastLoginAttempt.current = 0;

      const fingerprint = buildFingerprint();
      const stored: StoredSession = {
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        fingerprint,
        createdAt: Date.now(),
      };

      const profile = await tokenRequest<AdminProfile>('/auth/me', stored.accessToken);
      if (!isAdmin(profile)) throw new Error('Administrator access is required.');

      saveSession(stored);
      setState({
        session: stored,
        user: profile,
        isLoading: false,
        isAuthenticated: true,
      });
    } catch (error) {
      loginAttempts.current++;
      lastLoginAttempt.current = now;
      throw error;
    }
  }, []);

  const logout = useCallback(async () => {
    try {
      if (state.session?.accessToken && state.session.refreshToken) {
        await tokenRequest('/auth/logout', state.session.accessToken, {
          method: 'POST',
          body: JSON.stringify({ refreshToken: state.session.refreshToken }),
        });
      }
    } finally {
      clearSession();
    }
  }, [clearSession, state.session]);

  return (
    <AuthContext.Provider value={{ ...state, login, logout, request }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth(): AuthContextValue {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuth must be used within AuthProvider');
  return context;
}
