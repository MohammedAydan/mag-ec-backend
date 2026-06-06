import { Component, type ErrorInfo, type ReactNode } from 'react';
import { AlertTriangle, RefreshCw } from 'lucide-react';
import { TranslationContext } from '@/lib/i18n';

interface ErrorBoundaryProps {
  children: ReactNode;
  fallback?: ReactNode;
}

interface ErrorBoundaryState {
  error: Error | null;
  hasError: boolean;
}

export class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  static contextType = TranslationContext;
  declare context: React.ContextType<typeof TranslationContext>;

  constructor(props: ErrorBoundaryProps) {
    super(props);
    this.state = { error: null, hasError: false };
  }

  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    return { error, hasError: true };
  }

  componentDidCatch(error: Error, info: ErrorInfo): void {
    console.error('[Dashboard ErrorBoundary]', error, info.componentStack);
  }

  handleReset = (): void => {
    this.setState({ error: null, hasError: false });
  };

  render(): ReactNode {
    if (this.state.hasError) {
      if (this.props.fallback) return this.props.fallback;

      const t = this.context?.t ?? ((key: string) => key);

      return (
        <div className="flex min-h-screen flex-col items-center justify-center gap-6 bg-[#050505] px-4 text-center">
          <div className="flex h-16 w-16 items-center justify-center border border-red-400/20 bg-red-400/10 text-red-400">
            <AlertTriangle className="h-8 w-8" />
          </div>
          <div>
            <p className="font-serif text-xl italic text-white">{t('error.title')}</p>
            <p className="mt-2 font-mono text-xs text-neutral-500">
              {this.state.error?.message ?? t('error.description')}
            </p>
          </div>
          <button
            onClick={this.handleReset}
            className="flex cursor-pointer items-center gap-2 border border-neutral-700 bg-[#0f0f0f] px-6 py-2.5 font-mono text-xs uppercase tracking-widest text-neutral-300 transition-colors hover:border-neutral-500 hover:text-white"
          >
            <RefreshCw className="h-3.5 w-3.5" />
            {t('error.reload')}
          </button>
        </div>
      );
    }

    return this.props.children;
  }
}
