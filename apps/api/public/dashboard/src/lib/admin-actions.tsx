import { useState } from 'react';
import { useQueryClient, type QueryKey } from '@tanstack/react-query';
import { useAuth } from './auth';
import { ApiRequestError } from './http';

export type ActionPrimitive = string | number | boolean | null;
export type ActionValue = ActionPrimitive | ActionValues | ActionValue[];

export interface ActionValues {
  [key: string]: ActionValue | undefined;
}

export interface ActionOption {
  value: string;
  label: string;
  description?: string;
}

interface ActionFieldBase {
  name: string;
  label: string;
  description?: string;
  placeholder?: string;
  required?: boolean;
  width?: 'full' | 'half';
}

export interface TextActionField extends ActionFieldBase {
  type: 'text' | 'email' | 'password' | 'textarea';
  rows?: number;
}

export interface NumberActionField extends ActionFieldBase {
  type: 'number';
  min?: number;
  max?: number;
  step?: number;
}

export interface RadioActionField extends ActionFieldBase {
  type: 'radio';
  options: ActionOption[];
}

export interface CheckboxListActionField extends ActionFieldBase {
  type: 'checkbox-list';
  options: ActionOption[];
  minItems?: number;
}

export interface SelectActionField extends ActionFieldBase {
  type: 'select';
  options: ActionOption[];
}

export interface SwitchActionField extends ActionFieldBase {
  type: 'switch';
  onLabel?: string;
  offLabel?: string;
}

export interface StringListActionField extends ActionFieldBase {
  type: 'string-list';
  addLabel: string;
  emptyLabel?: string;
  itemLabel?: string;
  minItems?: number;
}

export interface GroupListActionField extends ActionFieldBase {
  type: 'group-list';
  addLabel: string;
  emptyLabel?: string;
  itemLabel?: string;
  minItems?: number;
  fields: ActionField[];
  defaultItem?: ActionValues;
}

export type ActionField =
  | TextActionField
  | NumberActionField
  | RadioActionField
  | CheckboxListActionField
  | SelectActionField
  | SwitchActionField
  | StringListActionField
  | GroupListActionField;

export interface PreparedActionRequest {
  path?: string;
  method?: string;
  headers?: HeadersInit;
  body?: unknown;
}

export interface FormAction {
  title: string;
  description: string;
  path: string;
  method: string;
  values: ActionValues;
  fields: ActionField[];
  submitLabel?: string;
  successMessage?: string;
  tone?: 'primary' | 'danger';
  prepare?: (values: ActionValues) => PreparedActionRequest;
}

function flattenFieldErrors(
  fieldErrors: Record<string, string[]> | undefined,
): Record<string, string> {
  if (!fieldErrors) return {};

  return Object.fromEntries(
    Object.entries(fieldErrors)
      .filter(([, messages]) => Array.isArray(messages) && messages.length > 0)
      .map(([field, messages]) => [field, messages.join(' ')])
  );
}

export function useActionForm(invalidate: QueryKey[] = []) {
  const { request } = useAuth();
  const queryClient = useQueryClient();
  const [action, setAction] = useState<FormAction | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [fieldErrors, setFieldErrors] = useState<Record<string, string>>({});
  const [feedback, setFeedback] = useState<string | null>(null);

  const open = (next: FormAction) => {
    setAction(next);
    setError(null);
    setFieldErrors({});
    setFeedback(null);
  };

  const close = () => {
    if (busy) return;
    setAction(null);
    setError(null);
    setFieldErrors({});
  };

  const execute = async (values: ActionValues) => {
    if (!action) return;

    setBusy(true);
    setError(null);
    setFieldErrors({});

    try {
      const prepared = action.prepare?.(values) ?? {};
      const body = prepared.body ?? values;

      await request(prepared.path ?? action.path, {
        method: prepared.method ?? action.method,
        headers: prepared.headers,
        body:
          body === undefined
            ? undefined
            : body instanceof FormData
              ? body
              : JSON.stringify(body),
      });

      await Promise.all(
        invalidate.map((queryKey) => queryClient.invalidateQueries({ queryKey }))
      );

      setAction(null);
      setFeedback(action.successMessage ?? `${action.title} completed successfully.`);
    } catch (requestError) {
      if (requestError instanceof ApiRequestError) {
        setError(requestError.message);
        setFieldErrors(flattenFieldErrors(requestError.fieldErrors));
      } else {
        setError(
          requestError instanceof Error ? requestError.message : 'Unable to execute action.'
        );
      }
    } finally {
      setBusy(false);
    }
  };

  return {
    action,
    busy,
    error,
    fieldErrors,
    feedback,
    open,
    close,
    execute,
    setFeedback,
  };
}

export const useJsonAction = useActionForm;

export function useDirectAction(invalidate: QueryKey[] = []) {
  const { request } = useAuth();
  const queryClient = useQueryClient();
  const [pending, setPending] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<string | null>(null);
  const [failure, setFailure] = useState<string | null>(null);

  const run = async (
    key: string,
    path: string,
    init: RequestInit = { method: 'POST', body: '{}' },
  ) => {
    setPending(key);
    setFeedback(null);
    setFailure(null);
    try {
      await request(path, init);
      await Promise.all(
        invalidate.map((queryKey) => queryClient.invalidateQueries({ queryKey }))
      );
      setFeedback('The requested action was completed.');
    } catch (error) {
      setFailure(error instanceof Error ? error.message : 'Action failed.');
    } finally {
      setPending(null);
    }
  };

  return { run, pending, feedback, failure, setFeedback };
}
