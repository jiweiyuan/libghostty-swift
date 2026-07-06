# Ghostty Patches

This directory is the single place for local upstream Ghostty patches used by
the `libghostty-spm` build pipeline.

## Rules

- Keep patches numbered so they apply in a stable order.
- Prefer standard unified diff files (`.patch`) when the upstream context is
  stable.
- Use executable patch scripts (`.sh`) only when upstream context is too
  unstable for a reliable diff.
- Every patch in this directory must be safe to re-run.
- Patches here are applied automatically by `Script/build-ghostty.sh`, so they
  affect macOS, iOS, and Mac Catalyst builds equally.

## Current goal

This patch workflow exists so we can carry host-managed IO work required for
sandboxed iOS, macOS, and Mac Catalyst integration without hiding upstream
modifications inside ad-hoc build script edits.

## Disabled patches

- `0002-host-managed-io.patch` — **dropped, upstreamed.** As of ghostty
  `2da015c` (July 2026) the host-managed IO backend lives in ghostty proper:
  the C API (`ghostty_surface_write_buffer`, `ghostty_surface_process_exit`, the
  `receive_buffer`/`receive_resize` callbacks and the `GHOSTTY_SURFACE_IO_BACKEND_*`
  enum), `src/termio/HostManaged.zig`, and the `Surface.zig` wiring are all
  present natively with signatures identical to what this patch added, so the
  `GhosttyTerminal` InMemory backend compiles against upstream unchanged. Kept
  for reference under `Patches/ghostty-disabled/`; re-enable only if building an
  older ghostty ref that predates upstreaming.
