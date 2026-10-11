# Athlier Launcher

The existing Athlier UI launcher, preserved unchanged from Athlier-UI commit
`fb4e924232dde9c3a92e07b392ef1763b301a53f` on 2026-10-11 at the owner's request.
This is a launcher component, not another UI application.

## Installed entry and behavior

On the inspected machine, Super/Meta opens KDE's application launcher menu.
The installed `~/.local/share/applications/athlier-ui.desktop` entry points to
`/run/media/adie/AI Stack/Athlier-UI/Athlier-UI/launcher/athlier-ui-launcher.sh`.
Super itself is not directly bound to this script.

- `athlier-ui.desktop`: the existing menu entry and its absolute application path.
- `athlier-ui-launcher.sh`: starts `npm start` in the UI checkout, prevents a
  second launch with `flock`, and logs to
  `${XDG_STATE_HOME:-$HOME/.local/state}/athlier-ui/launcher.log`.

The script, desktop file and paths are preserved byte-for-byte. The installed
entry still points to the original UI checkout; this repository is now the
preserved launcher source. This extraction did not repoint the installed entry,
change the Super binding, restart the UI or remove the original files.
Installation on another machine needs an explicitly reviewed path change.

## Provenance and verification

Both files matched their source commit before extraction:

| File | SHA-256 |
| --- | --- |
| `athlier-ui-launcher.sh` | `7124dde56942cd9224f1001227dafac46299074f84a8e3487bb425629fe74acd` |
| `athlier-ui.desktop` | `ffde1a9a06ee2aba8525b7a6c071783183f084cdbe7a4d9e2ff2d6446f1aa985` |

Run `bash -n athlier-ui-launcher.sh` for syntax validation. A live launch was
not part of this extraction; `npm start` may build or start the UI and must
not be invoked just to audit documentation.

## Mandatory workflow: research → dev → main

These are Git branches/stages, not folders on `main`.

1. **Research:** put ideas, probes and unqualified experiments on `research` or
   a `research/<topic>` branch. Record the question, provenance, result and
   limitations. Do not present experiments as working features.
2. **Dev:** implement and run reproducible A/B or regression tests on `dev` or
   a `dev/<topic>` branch. Keep the module independently runnable/testable
   during development, with an explicit integration interface for Athlier-UI.
3. **Main:** only owner-approved live code and the documentation, tests and
   configuration needed to maintain it. No scratch files, failed candidates,
   duplicate implementations, generated caches or speculative feature dumps.
4. **Promotion:** before any merge, cherry-pick, push, release or deployment
   that promotes work to `main`, present the exact candidate commit(s), scope,
   test evidence, known failures and rollback. Obtain **explicit approval from
   the human owner for that promotion**. Passing tests, another AI's approval,
   old approval for different work, or a request to build/fix something is not
   approval to promote. Never self-approve or enable automatic promotion.
5. **Preservation:** verify repository, branch and dirty state before editing.
   Use an isolated checkout when needed. Never reset, clean, force-push, delete
   branches or discard unique/uncommitted work without explicit owner approval.
   Keep useful evidence with its experiment; do not use any branch as an
   unlabelled storage dump.

If a stage branch is missing, create the appropriate branch from the verified
baseline before implementation; do not work on `main` as a fallback. Preserve
existing branch namespaces (`research/current` is valid when `research/*`
already exists). A `research/` directory on `main` is not permission to put
new experiments there.

Read this repository's current `main` README and `AGENTS.md` before starting
from an older branch. Keep README status accurate for the branch it describes;
separate source presence, unit tests, integration evidence and live qualification.
An explicit owner request for documentation-only maintenance on `main` permits
only that scoped documentation update, not implementation promotion.

See [AGENTS.md](AGENTS.md) for AI contributor instructions.
