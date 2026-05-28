/* eslint-disable react-refresh/only-export-components */
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
  type ReactNode,
} from 'react';
import { ApiRequestError, publicRequest, tokenRequest } from './http';

const SESSION_KEY = 'atelier.admin.session';

export interface AdminProfile {
  id?: string;
  email: string;
  displayName?: string;
  roles?: Array<string | { name?: string; key?: string }>;
  role?: string;
  userType?: string;
  type?: string;
}

interface StoredSession {
  accessToken: string;
  refreshToken?: string;
}

interface LoginResponse extends StoredSession {
  user?: AdminProfile;
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

function loadSession(): StoredSession | null {
  try {
    const raw = sessionStorage.getItem(SESSION_KEY);
    return raw ? (JSON.parse(raw) as StoredSession) : null;
  } catch {
    return null;
  }
}

function saveSession(session: StoredSession | null): void {
  if (session) sessionStorage.setItem(SESSION_KEY, JSON.stringify(session));
  else sessionStorage.removeItem(SESSION_KEY);
}

function isAdmin(user: AdminProfile): boolean {
  return (user.userType ?? user.type) === 'ADMIN';
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<AuthState>({
    session: loadSession(),
    user: null,
    isLoading: true,
    isAuthenticated: false,
  });

  const clearSession = useCallback(() => {
    saveSession(null);
    setState({ session: null, user: null, isLoading: false, isAuthenticated: false });
  }, []);

  const refreshTokens = useCallback(async (session: StoredSession): Promise<StoredSession> => {
    if (!session.refreshToken) throw new Error('No refresh token is available.');
    const refreshed = await publicRequest<StoredSession>('/auth/refresh', {
      method: 'POST',
      body: JSON.stringify({ refreshToken: session.refreshToken }),
    });
    const next = {
      accessToken: refreshed.accessToken,
      refreshToken: refreshed.refreshToken ?? session.refreshToken,
    };
    saveSession(next);
    setState((current) => ({ ...current, session: next }));
    return next;
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
        } catch (refreshError) {
          clearSession();
          throw refreshError;
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
        const profile = await request<AdminProfile>('/auth/me');
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
    // Run on the stored session during startup only; request performs token refresh when necessary.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const login = useCallback(async (email: string, password: string) => {
    const session = await publicRequest<LoginResponse>('/auth/login', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    const stored: StoredSession = {
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
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
