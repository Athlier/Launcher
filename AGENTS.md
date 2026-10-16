**NON-NEGOTIABLE OWNER RULE — LLAMASWAP / MODULE HARNESS BOUNDARY**

**LlamaSwap owns model infrastructure. Each Athlier module owns its behaviour through its own harness.**

**LlamaSwap: model loading, GPU allocation, routing, hardware compatibility, and established production launch flags.**

**Module-owned harness: context budgeting, token limits, sampling policies, validation, retries, evidence requirements, and other module-specific controls.**

**No module may change shared LlamaSwap settings to solve its own problems.**

**No model tuning without explicit owner approval.**

**Do not change LlamaSwap configurations, model flags, GPU assignments, routing, or shared inference services as part of module work. If a module needs different behaviour, implement that constraint inside its own module-owned harness. If a genuine infrastructure defect is suspected, stop and request separate owner authorisation before altering infrastructure.**

# Athlier Launcher instructions

Preserve the installed launcher behavior and host paths unless the owner asks
for a change. Do not change desktop bindings, launch/rebuild the UI or remove
the original source as a side effect of repository maintenance.

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
