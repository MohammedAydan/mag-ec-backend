export function LoadingScreen() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-6 bg-[#050505]">
      <div className="h-8 w-8 animate-spin rounded-full border-2 border-neutral-700 border-t-amber-500" />
      <div className="text-center">
        <p className="font-mono text-xs uppercase tracking-[0.18em] text-neutral-500">
          Syncing Workspace
        </p>
        <p className="mt-2 font-mono text-[11px] leading-relaxed text-neutral-600">
          Loading operational data and active workflows.
        </p>
      </div>
    </div>
  );
}
