import { useEffect, useState } from 'react';
import { AlertCircle, CheckCircle2, X } from 'lucide-react';

interface FeedbackProps {
  message?: string | null;
  tone?: 'success' | 'danger';
  durationMs?: number;
  onDismiss?: () => void;
}

export function Feedback({ message, tone = 'success', durationMs, onDismiss }: FeedbackProps) {
  const [dismissedMessage, setDismissedMessage] = useState<string | null>(null);

  useEffect(() => {
    if (!message || !durationMs) return;
    const timer = setTimeout(() => {
      setDismissedMessage(message);
      onDismiss?.();
    }, durationMs);
    return () => clearTimeout(timer);
  }, [message, durationMs, onDismiss]);

  const isVisible = message != null && dismissedMessage !== message;

  if (!isVisible) return null;

  const handleDismiss = (): void => {
    if (message) setDismissedMessage(message);
    onDismiss?.();
  };

  const toneStyles =
    tone === 'success'
      ? 'border-green-500/30 bg-green-500/5 text-green-400'
      : 'border-red-400/30 bg-red-400/5 text-red-400';

  return (
    <div
      role="status"
      className={`flex items-start gap-3 border px-4 py-3.5 font-mono text-xs ${toneStyles}`}
    >
      {tone === 'success' ? (
        <CheckCircle2 className="mt-0.5 h-4 w-4 flex-shrink-0" />
      ) : (
        <AlertCircle className="mt-0.5 h-4 w-4 flex-shrink-0" />
      )}
      <span className="flex-1">{message}</span>
      <button
        onClick={handleDismiss}
        className="cursor-pointer p-0.5 text-current opacity-60 hover:opacity-100"
        aria-label="Dismiss"
      >
        <X className="h-3.5 w-3.5" />
      </button>
    </div>
  );
}
