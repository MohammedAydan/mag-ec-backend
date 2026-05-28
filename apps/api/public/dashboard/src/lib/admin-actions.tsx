import { useState } from 'react';
import { useQueryClient, type QueryKey } from '@tanstack/react-query';
import { useAuth } from './auth';
import type { JsonAction } from '@/components/ui/AdminUi';

export function useJsonAction(invalidate: QueryKey[] = []) {
  const { request } = useAuth();
  const queryClient = useQueryClient();
  const [action, setAction] = useState<JsonAction | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<string | null>(null);

  const open = (next: JsonAction) => {
    setAction(next);
    setError(null);
    setFeedback(null);
  };

  const close = () => {
    if (!busy) {
      setAction(null);
      setError(null);
    }
  };

  const execute = async (payload: unknown) => {
    if (!action) return;
    setBusy(true);
    setError(null);
    try {
      await request(action.path, {
        method: action.method,
        body: JSON.stringify(payload),
      });
      await Promise.all(invalidate.map((queryKey) => queryClient.invalidateQueries({ queryKey })));
      setAction(null);
      setFeedback(`${action.title} completed successfully.`);
    } catch (requestError) {
      setError(requestError instanceof Error ? requestError.message : 'Unable to execute action.');
    } finally {
      setBusy(false);
    }
  };

  return { action, busy, error, feedback, open, close, execute, setFeedback };
}

export function useDirectAction(invalidate: QueryKey[] = []) {
  const { request } = useAuth();
  const queryClient = useQueryClient();
  const [pending, setPending] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<string | null>(null);
  const [failure, setFailure] = useState<string | null>(null);

  const run = async (key: string, path: string, init: RequestInit = { method: 'POST', body: '{}' }) => {
    setPending(key);
    setFeedback(null);
    setFailure(null);
    try {
      await request(path, init);
      await Promise.all(invalidate.map((queryKey) => queryClient.invalidateQueries({ queryKey })));
      setFeedback('The requested action was completed.');
    } catch (error) {
      setFailure(error instanceof Error ? error.message : 'Action failed.');
    } finally {
      setPending(null);
    }
  };

  return { run, pending, feedback, failure, setFeedback };
}
