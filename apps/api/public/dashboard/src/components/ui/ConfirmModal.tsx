import { useMemo, useState, useEffect, type FormEvent, type ReactElement } from 'react';
import { AlertCircle, Minus, Plus, Sparkles, X } from 'lucide-react';
import { useT } from '@/lib/i18n';
import type {
  ActionField,
  ActionValue,
  ActionValues,
  FormAction,
  GroupListActionField,
  SelectActionField,
  StringListActionField,
  TextActionField,
} from '@/lib/admin-actions';

interface ConfirmModalProps {
  action: FormAction | null;
  busy: boolean;
  error?: string | null;
  fieldErrors?: Record<string, string>;
  onClose: () => void;
  onSubmit: (values: ActionValues) => Promise<void>;
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function pathSegments(path: string): string[] {
  return path.split('.').filter(Boolean);
}

function getValueAtPath(values: ActionValues, path: string): ActionValue | undefined {
  let cursor: unknown = values;

  for (const segment of pathSegments(path)) {
    if (Array.isArray(cursor)) {
      const index = Number(segment);
      if (Number.isNaN(index)) return undefined;
      cursor = cursor[index];
      continue;
    }

    if (isRecord(cursor)) {
      cursor = cursor[segment];
      continue;
    }

    return undefined;
  }

  return cursor as ActionValue | undefined;
}

function isNumericSegment(segment: string): boolean {
  return /^\d+$/.test(segment);
}

function setValueAtPath(
  values: ActionValues,
  path: string,
  nextValue: ActionValue,
): ActionValues {
  const clone = structuredClone(values);
  const segments = pathSegments(path);

  if (!segments.length) return clone;

  let cursor: unknown = clone;

  for (let index = 0; index < segments.length; index += 1) {
    const segment = segments[index];
    const isLast = index === segments.length - 1;

    if (isLast) {
      if (Array.isArray(cursor)) {
        cursor[Number(segment)] = nextValue;
      } else if (isRecord(cursor)) {
        cursor[segment] = nextValue;
      }
      return clone;
    }

    const nextSegment = segments[index + 1];

    if (Array.isArray(cursor)) {
      const arrayIndex = Number(segment);
      const current = cursor[arrayIndex];
      if (current === undefined) {
        cursor[arrayIndex] = isNumericSegment(nextSegment) ? [] : {};
      }
      cursor = cursor[arrayIndex];
      continue;
    }

    if (isRecord(cursor)) {
      const current = cursor[segment];
      if (current === undefined) {
        cursor[segment] = isNumericSegment(nextSegment) ? [] : {};
      }
      cursor = cursor[segment];
      continue;
    }

    return clone;
  }

  return clone;
}

function emptyValueForField(field: ActionField): ActionValue {
  switch (field.type) {
    case 'switch':
      return false;
    case 'string-list':
    case 'checkbox-list':
    case 'group-list':
      return [];
    default:
      return '';
  }
}

function createDefaultGroupItem(field: GroupListActionField): ActionValues {
  if (field.defaultItem) {
    return structuredClone(field.defaultItem);
  }

  const item: ActionValues = {};
  field.fields.forEach((child) => {
    item[child.name] = emptyValueForField(child);
  });
  return item;
}

function appendArrayItem(
  values: ActionValues,
  path: string,
  nextItem: ActionValue,
): ActionValues {
  const current = getValueAtPath(values, path);
  const next = Array.isArray(current) ? [...current, nextItem] : [nextItem];
  return setValueAtPath(values, path, next);
}

function removeArrayItem(values: ActionValues, path: string, index: number): ActionValues {
  const current = getValueAtPath(values, path);
  if (!Array.isArray(current)) return values;
  const next = current.filter((_, itemIndex) => itemIndex !== index);
  return setValueAtPath(values, path, next);
}

function isBlank(value: ActionValue | undefined): boolean {
  if (value === undefined || value === null) return true;
  if (typeof value === 'string') return value.trim() === '';
  if (Array.isArray(value)) return value.length === 0;
  return false;
}

function validateFields(
  fields: ActionField[],
  values: ActionValues,
  t: (key: string, params?: Record<string, string | number>) => string,
  prefix = '',
): Record<string, string> {
  const errors: Record<string, string> = {};

  for (const field of fields) {
    const path = prefix ? `${prefix}.${field.name}` : field.name;
    const value = getValueAtPath(values, path);

    if (field.type === 'group-list') {
      const groups = Array.isArray(value) ? value : [];
      if (field.required && groups.length === 0) {
        errors[path] = t('form.atLeastOneItem', { label: field.label });
      }
      if (field.minItems && groups.length < field.minItems) {
        errors[path] = t('form.atLeastItems', { label: field.label, count: field.minItems });
      }
      groups.forEach((group, groupIndex) => {
        if (isRecord(group)) {
          Object.assign(
            errors,
            validateFields(field.fields, values, t, `${path}.${groupIndex}`)
          );
        }
      });
      continue;
    }

    if (field.type === 'string-list') {
      const listValues = Array.isArray(value) ? value : [];
      const populated = listValues.filter(
        (entry) => typeof entry === 'string' && entry.trim() !== ''
      );

      if (field.required && populated.length === 0) {
        errors[path] = t('form.atLeastOneValue', { label: field.label });
      }

      if (field.minItems && populated.length < field.minItems) {
        errors[path] = t('form.atLeastValues', { label: field.label, count: field.minItems });
      }

      continue;
    }

    if (field.type === 'checkbox-list') {
      const listValues = Array.isArray(value) ? value : [];
      if (field.required && listValues.length === 0) {
        errors[path] = t('form.atLeastOneSelection', { label: field.label });
      }
      if (field.minItems && listValues.length < field.minItems) {
        errors[path] = t('form.atLeastSelections', { label: field.label, count: field.minItems });
      }
      continue;
    }

    if (field.type === 'select') {
      if (field.required && isBlank(value)) {
        errors[path] = t('form.requiredHint');
      }
      continue;
    }

    if (field.required && isBlank(value)) {
      errors[path] = t('form.requiredHint');
      continue;
    }

    if (field.type === 'number' && !isBlank(value)) {
      const numericValue = Number(value);

      if (Number.isNaN(numericValue)) {
        errors[path] = t('form.mustBeNumber', { label: field.label });
        continue;
      }

      if (field.min !== undefined && numericValue < field.min) {
        errors[path] = t('form.mustBeAtLeast', { label: field.label, min: field.min });
      }

      if (field.max !== undefined && numericValue > field.max) {
        errors[path] = t('form.mustBeAtMost', { label: field.label, max: field.max });
      }
    }
  }

  return errors;
}

function fieldWidthClass(field: ActionField): string {
  return field.width === 'half' ? 'lg:col-span-1' : 'lg:col-span-2';
}

export function ConfirmModal({
  action,
  busy,
  error,
  fieldErrors = {},
  onClose,
  onSubmit,
}: ConfirmModalProps) {
  if (!action) return null;

  return (
    <ConfirmModalDrawer
      key={`${action.method}:${action.path}:${action.title}`}
      action={action}
      busy={busy}
      error={error}
      fieldErrors={fieldErrors}
      onClose={onClose}
      onSubmit={onSubmit}
    />
  );
}

/* ───── Drawer implementation ───── */

function ConfirmModalDrawer({
  action,
  busy,
  error,
  fieldErrors = {},
  onClose,
  onSubmit,
}: ConfirmModalProps & { action: FormAction }) {
  const { t } = useT();
  const [values, setValues] = useState<ActionValues>(() => structuredClone(action.values));
  const [validationErrors, setValidationErrors] = useState<Record<string, string>>({});

  const combinedErrors = useMemo(
    () => ({ ...fieldErrors, ...validationErrors }),
    [fieldErrors, validationErrors]
  );

  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && !busy) {
        onClose();
      }
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [busy, onClose]);

  const updatePath = (path: string, nextValue: ActionValue) => {
    setValues((current) => setValueAtPath(current, path, nextValue));
    setValidationErrors((current) => {
      const next = { ...current };
      delete next[path];
      return next;
    });
  };

  const renderTextField = (field: TextActionField, path: string) => {
    const value = getValueAtPath(values, path);
    const fieldError = combinedErrors[path];

    if (field.type === 'textarea') {
      return (
        <div key={path} className={fieldWidthClass(field)}>
          <label htmlFor={path} className="mb-1.5 block font-mono text-[10px] uppercase tracking-widest text-neutral-400">
            {field.label}
          </label>
          <textarea
            id={path}
            className="w-full border border-neutral-700 bg-[#0a0a0a] px-3 py-2 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:border-amber-500 focus:outline-none"
            placeholder={field.placeholder}
            rows={field.rows ?? 4}
            style={{ resize: 'vertical' }}
            value={typeof value === 'string' ? value : ''}
            onChange={(event) => updatePath(path, event.currentTarget.value)}
          />
          {field.description && (
            <p className="mt-1.5 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
          )}
          {fieldError && <p className="mt-1.5 font-mono text-[10px] text-red-400">{fieldError}</p>}
        </div>
      );
    }

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <label htmlFor={path} className="mb-1.5 block font-mono text-[10px] uppercase tracking-widest text-neutral-400">
          {field.label}
        </label>
        <input
          id={path}
          className={`w-full border bg-[#0a0a0a] px-3 py-2 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:outline-none ${
            fieldError ? 'border-red-400/50' : 'border-neutral-700 focus:border-amber-500'
          }`}
          type={field.type}
          placeholder={field.placeholder}
          value={typeof value === 'string' ? value : ''}
          onChange={(event) => updatePath(path, event.currentTarget.value)}
        />
        {field.description && (
          <p className="mt-1.5 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
        )}
        {fieldError && <p className="mt-1.5 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderNumberField = (field: ActionField, path: string) => {
    const value = getValueAtPath(values, path);
    const fieldError = combinedErrors[path];

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <label htmlFor={path} className="mb-1.5 block font-mono text-[10px] uppercase tracking-widest text-neutral-400">
          {field.label}
        </label>
        <input
          id={path}
          className={`w-full border bg-[#0a0a0a] px-3 py-2 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:outline-none ${
            fieldError ? 'border-red-400/50' : 'border-neutral-700 focus:border-amber-500'
          }`}
          type="number"
          inputMode="decimal"
          min={field.type === 'number' && field.min !== undefined ? field.min : undefined}
          max={field.type === 'number' && field.max !== undefined ? field.max : undefined}
          step={field.type === 'number' && field.step !== undefined ? field.step : undefined}
          placeholder={field.placeholder}
          value={typeof value === 'number' ? value : typeof value === 'string' ? value : ''}
          onChange={(event) =>
            updatePath(
              path,
              event.currentTarget.value === ''
                ? ''
                : Number(event.currentTarget.value)
            )
          }
        />
        {field.description && (
          <p className="mt-1.5 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
        )}
        {fieldError && <p className="mt-1.5 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderRadioField = (field: ActionField, path: string) => {
    if (field.type !== 'radio') return null;

    const fieldError = combinedErrors[path];
    const value = getValueAtPath(values, path);

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <p className="mb-2 font-mono text-[10px] uppercase tracking-widest text-neutral-400">{field.label}</p>
        {field.description && (
          <p className="mb-2 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
        )}
        <div className="space-y-2">
          {field.options.map((option) => (
            <label
              key={option.value}
              className={`flex cursor-pointer items-start gap-3 border bg-[#0f0f0f] px-3 py-2.5 transition-colors ${
                value === option.value ? 'border-amber-500/40 bg-amber-500/5' : 'border-neutral-700 hover:border-neutral-600'
              }`}
            >
              <input
                type="radio"
                className="mt-0.5 accent-amber-500"
                name={path}
                value={option.value}
                checked={value === option.value}
                onChange={(e) => updatePath(path, e.currentTarget.value)}
              />
              <div>
                <span className="block text-sm text-neutral-200">{option.label}</span>
                {option.description && (
                  <span className="block font-mono text-[10px] text-neutral-500">{option.description}</span>
                )}
              </div>
            </label>
          ))}
        </div>
        {fieldError && <p className="mt-2 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderSwitchField = (field: ActionField, path: string) => {
    if (field.type !== 'switch') return null;

    const fieldError = combinedErrors[path];
    const value = getValueAtPath(values, path);
    const isSelected = typeof value === 'boolean' ? value : false;

    return (
      <div
        key={path}
        className={`${fieldWidthClass(field)} border border-neutral-700 bg-[#0f0f0f] p-4`}
      >
        <div className="flex items-start justify-between gap-4">
          <div className="space-y-1">
            <p className="font-mono text-[10px] uppercase tracking-widest text-neutral-200">{field.label}</p>
            {field.description && (
              <p className="font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
            )}
            <p className="font-mono text-[9px] uppercase tracking-widest text-neutral-400">
              {isSelected ? field.onLabel ?? 'Enabled' : field.offLabel ?? 'Disabled'}
            </p>
          </div>
          <button
            type="button"
            role="switch"
            aria-checked={isSelected}
            onClick={() => updatePath(path, !isSelected)}
            className={`relative h-6 w-11 flex-shrink-0 transition-colors ${
              isSelected ? 'bg-amber-500' : 'bg-neutral-700'
            }`}
          >
            <span
              className={`absolute top-0.5 h-5 w-5 bg-white transition-transform ${
                isSelected ? 'left-[22px]' : 'left-0.5'
              }`}
            />
          </button>
        </div>
        {fieldError && <p className="mt-3 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderCheckboxListField = (field: ActionField, path: string) => {
    if (field.type !== 'checkbox-list') return null;

    const fieldError = combinedErrors[path];
    const value = getValueAtPath(values, path);
    const selected = Array.isArray(value)
      ? value.filter((entry): entry is string => typeof entry === 'string')
      : [];

    const toggleValue = (optionValue: string, checked: boolean) => {
      const next = checked
        ? [...selected, optionValue]
        : selected.filter((entry) => entry !== optionValue);
      updatePath(path, next);
    };

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <p className="mb-2 font-mono text-[10px] uppercase tracking-widest text-neutral-200">{field.label}</p>
        {field.description && (
          <p className="mb-3 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
        )}
        <div className="space-y-2">
          {field.options.map((option) => {
            const isSelected = selected.includes(option.value);
            return (
              <label
                key={option.value}
                className={`flex cursor-pointer items-start gap-3 border bg-[#0f0f0f] px-3 py-2.5 transition-colors ${
                  isSelected ? 'border-amber-500/40 bg-amber-500/5' : 'border-neutral-700 hover:border-neutral-600'
                }`}
              >
                <input
                  type="checkbox"
                  className="mt-0.5 accent-amber-500"
                  checked={isSelected}
                  onChange={(e) => toggleValue(option.value, e.currentTarget.checked)}
                />
                <div>
                  <span className="block text-sm text-neutral-200">{option.label}</span>
                  {option.description && (
                    <span className="block font-mono text-[10px] text-neutral-500">{option.description}</span>
                  )}
                </div>
              </label>
            );
          })}
        </div>
        {fieldError && <p className="mt-2 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderSelectField = (field: SelectActionField, path: string) => {
    const fieldError = combinedErrors[path];
    const value = getValueAtPath(values, path);

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <label htmlFor={path} className="mb-1.5 block font-mono text-[10px] uppercase tracking-widest text-neutral-400">
          {field.label}
        </label>
        <select
          id={path}
          className={`w-full border bg-[#0a0a0a] px-3 py-2 font-mono text-sm text-neutral-200 focus:outline-none ${
            fieldError ? 'border-red-400/50' : 'border-neutral-700 focus:border-amber-500'
          }`}
          value={typeof value === 'string' ? value : ''}
          onChange={(event) => updatePath(path, event.currentTarget.value)}
        >
          <option value="" className="bg-[#0f0f0f] text-neutral-500">
            {field.placeholder ?? `Select ${field.label.toLowerCase()}`}
          </option>
          {field.options.map((option) => (
            <option key={option.value} value={option.value} className="bg-[#0f0f0f] text-neutral-200">
              {option.label}
            </option>
          ))}
        </select>
        {field.description && (
          <p className="mt-1.5 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
        )}
        {fieldError && <p className="mt-1.5 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderStringListField = (field: StringListActionField, path: string) => {
    const fieldError = combinedErrors[path];
    const currentValues = getValueAtPath(values, path);
    const items = Array.isArray(currentValues) ? currentValues : [];

    return (
      <div key={path} className={fieldWidthClass(field)}>
        <div className="mb-3 flex items-start justify-between gap-4">
          <div>
            <p className="font-mono text-[10px] uppercase tracking-widest text-neutral-200">{field.label}</p>
            {field.description && (
              <p className="mt-1 font-mono text-[10px] leading-relaxed text-neutral-500">{field.description}</p>
            )}
          </div>
          <button
            type="button"
            onClick={() => setValues((current) => appendArrayItem(current, path, ''))}
            className="flex cursor-pointer items-center gap-1 border border-neutral-700 px-3 py-1.5 font-mono text-[10px] uppercase tracking-widest text-neutral-400 transition-colors hover:border-neutral-500 hover:text-white"
          >
            <Plus className="h-3 w-3" /> {field.addLabel}
          </button>
        </div>

        <div className="space-y-3">
          {items.length === 0 && (
            <div className="border border-dashed border-neutral-700 px-4 py-5 text-center font-mono text-xs text-neutral-500">
              {field.emptyLabel ?? 'No values added yet.'}
            </div>
          )}

          {items.map((item, index) => {
            const itemPath = `${path}.${index}`;
            return (
              <div key={itemPath} className="border border-neutral-700 bg-[#0f0f0f] p-4">
                <div className="flex items-start gap-3">
                  <div className="flex-1">
                    <label className="mb-1 block font-mono text-[10px] uppercase tracking-widest text-neutral-400">
                      {field.itemLabel ?? `${field.label} ${index + 1}`}
                    </label>
                    <input
                      className="w-full border border-neutral-700 bg-[#0a0a0a] px-3 py-2 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:border-amber-500 focus:outline-none"
                      placeholder={field.placeholder}
                      value={typeof item === 'string' ? item : ''}
                      onChange={(event) => updatePath(itemPath, event.currentTarget.value)}
                    />
                  </div>
                  <button
                    type="button"
                    onClick={() => setValues((current) => removeArrayItem(current, path, index))}
                    className="mt-6 cursor-pointer border border-neutral-700 p-1.5 text-neutral-400 transition-colors hover:border-red-400/50 hover:text-red-400"
                    aria-label={`Remove ${field.itemLabel ?? field.label}`}
                  >
                    <Minus className="h-3 w-3" />
                  </button>
                </div>
              </div>
            );
          })}
        </div>

        {fieldError && <p className="mt-2 font-mono text-[10px] text-red-400">{fieldError}</p>}
      </div>
    );
  };

  const renderFields = (fields: ActionField[], prefix = ''): ReactElement[] =>
    fields.flatMap((field) => {
      const path = prefix ? `${prefix}.${field.name}` : field.name;

      switch (field.type) {
        case 'text':
        case 'email':
        case 'password':
        case 'textarea':
          return [renderTextField(field, path)];
        case 'number':
          return [renderNumberField(field, path)];
        case 'radio': {
          const radioField = renderRadioField(field, path);
          return radioField ? [radioField] : [];
        }
        case 'checkbox-list': {
          const checkboxField = renderCheckboxListField(field, path);
          return checkboxField ? [checkboxField] : [];
        }
        case 'select': {
          if (field.type !== 'select') return [];
          return [renderSelectField(field, path)];
        }
        case 'switch': {
          const switchField = renderSwitchField(field, path);
          return switchField ? [switchField] : [];
        }
        case 'string-list':
          return [renderStringListField(field, path)];
        case 'group-list': {
          const currentValues = getValueAtPath(values, path);
          const items = Array.isArray(currentValues) ? currentValues : [];
          const fieldError = combinedErrors[path];

          return [
            <div key={path} className={fieldWidthClass(field)}>
              <div className="mb-3 flex items-start justify-between gap-4">
                <div>
                  <p className="font-mono text-[10px] uppercase tracking-widest text-neutral-200">{field.label}</p>
                  {field.description && (
                    <p className="mt-1 font-mono text-[10px] leading-relaxed text-neutral-500">
                      {field.description}
                    </p>
                  )}
                </div>
                <button
                  type="button"
                  onClick={() =>
                    setValues((current) =>
                      appendArrayItem(current, path, createDefaultGroupItem(field))
                    )
                  }
                  className="flex cursor-pointer items-center gap-1 border border-neutral-700 px-3 py-1.5 font-mono text-[10px] uppercase tracking-widest text-neutral-400 transition-colors hover:border-neutral-500 hover:text-white"
                >
                  <Plus className="h-3 w-3" /> {field.addLabel}
                </button>
              </div>

              <div className="space-y-4">
                {items.length === 0 && (
                  <div className="border border-dashed border-neutral-700 px-4 py-5 text-center font-mono text-xs text-neutral-500">
                    {field.emptyLabel ?? 'No items configured yet.'}
                  </div>
                )}

                {items.map((_, index) => (
                  <div key={`${path}.${index}`} className="border border-neutral-700 bg-[#0f0f0f] p-4">
                    <div className="mb-4 flex items-center justify-between gap-3">
                      <p className="font-mono text-[10px] uppercase tracking-widest text-neutral-200">
                        {field.itemLabel ?? `${field.label} ${index + 1}`}
                      </p>
                      <button
                        type="button"
                        onClick={() =>
                          setValues((current) => removeArrayItem(current, path, index))
                        }
                        className="cursor-pointer border border-neutral-700 p-1.5 text-neutral-400 transition-colors hover:border-red-400/50 hover:text-red-400"
                        aria-label={`Remove ${field.itemLabel ?? field.label}`}
                      >
                        <Minus className="h-3 w-3" />
                      </button>
                    </div>
                    <div className="grid gap-4 lg:grid-cols-2">
                      {renderFields(field.fields, `${path}.${index}`)}
                    </div>
                  </div>
                ))}
              </div>

              {fieldError && <p className="mt-2 font-mono text-[10px] text-red-400">{fieldError}</p>}
            </div>,
          ];
        }
      }
    });

  const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const nextErrors = validateFields(action.fields, values, t);
    setValidationErrors(nextErrors);

    if (Object.keys(nextErrors).length > 0) return;

    await onSubmit(values);
  };

  const handleClose = () => {
    if (busy) return;
    onClose();
  };

  const toneClass = action.tone === 'danger' ? 'bg-red-600 hover:bg-red-500' : 'bg-white text-black hover:bg-neutral-200';

  return (
    <div className="fixed inset-0 z-50">
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/70 backdrop-blur-sm" onClick={handleClose} />

      {/* Slide-in panel */}
      <div className="absolute right-0 top-0 h-full w-full max-w-[min(92vw,42rem)] border-l border-neutral-800 bg-[#050505] shadow-2xl">
        {/* Header */}
        <div className="border-b border-neutral-800 px-6 pb-4 pt-5">
          <div className="flex items-start justify-between gap-4">
            <div className="flex items-start gap-3">
              <div className="flex h-10 w-10 items-center justify-center border border-amber-500/20 bg-amber-500/10 text-amber-500">
                <Sparkles className="h-4 w-4" />
              </div>
              <div>
                <p className="font-mono text-[10px] uppercase tracking-[0.2em] text-neutral-500">
                  Structured Action
                </p>
                <h2 className="mt-1 font-serif text-2xl italic tracking-tight text-white">
                  {action.title}
                </h2>
                <p className="mt-1 font-mono text-xs leading-6 text-neutral-400">
                  {action.description}
                </p>
              </div>
            </div>
            <button
              onClick={handleClose}
              className="cursor-pointer p-1 text-neutral-500 transition-colors hover:text-white"
              disabled={busy}
              aria-label="Close panel"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
        </div>

        {/* Body */}
        <form onSubmit={handleSubmit} className="flex h-[calc(100%-129px)] flex-col">
          <div className="flex-1 overflow-y-auto px-6 py-5">
            {error && (
              <div
                role="alert"
                className="mb-4 flex items-start gap-3 border border-red-400/30 bg-red-400/5 px-4 py-3 font-mono text-xs text-red-400"
              >
                <AlertCircle className="mt-0.5 h-4 w-4 flex-shrink-0" />
                <span>{error}</span>
              </div>
            )}

            {action.fields.length > 0 ? (
              <div className="grid gap-4 lg:grid-cols-2">{renderFields(action.fields)}</div>
            ) : (
              <div className="border border-neutral-700 bg-[#0f0f0f] px-5 py-6 font-mono text-xs leading-6 text-neutral-400">
                This action does not need extra form input. Submit when you are ready to continue.
              </div>
            )}
          </div>

          {/* Footer */}
          <div className="border-t border-neutral-800 px-6 py-4">
            <div className="flex w-full items-center justify-end gap-3">
              <button
                type="button"
                onClick={handleClose}
                disabled={busy}
                className="cursor-pointer border border-neutral-700 bg-[#0f0f0f] px-5 py-2 font-mono text-xs uppercase tracking-widest text-neutral-400 transition-colors hover:border-neutral-500 hover:text-white disabled:cursor-not-allowed disabled:opacity-50"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={busy}
                className={`cursor-pointer px-6 py-2 font-mono text-xs font-semibold uppercase tracking-widest transition-colors disabled:cursor-not-allowed disabled:opacity-50 ${toneClass}`}
              >
                {busy ? 'Saving...' : action.submitLabel ?? 'Save changes'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
