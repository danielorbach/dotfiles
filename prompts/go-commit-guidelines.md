# OneLayer Go Commit Message Guidelines for LLMs

> **Purpose:** Enable LLMs to generate commit messages that match OneLayer team conventions. Commits should tell a coherent story, not track the actions of a developer.

## Message Structure

```text
package/prefix: a short one line summary of the change.
  [  a blank line  ]
A short paragraph explaining the key aspects of the change and the
reason for the change. For more critical changes include any
references to context that may help future readers.
  [  a blank line  ]
[ optionally, add more issue references ]
```

## One-Liner Format

**Core Rule:** The first line should complete the sentence: **"This change modifies TARGET to _____"**

**For Go packages:** "This change modifies package PACKAGE to _____"
**For other targets:** "This change modifies TARGET to _____"

**Examples:**
- `visibility/activity: expose UE state property` → "This change modifies package visibility/activity to expose UE state property"
- `docs: update installation guide` → "This change modifies docs to update installation guide"  
- `github: add workflow for testing` → "This change modifies github integration to add workflow for testing"

**Format rules:**
- Does not start with a capital letter
- Is not a complete sentence  
- Actually summarizes the result of the change
- ≤ 72 characters total

**Key Principle:** Describe HOW the target changes, not WHAT you did as a developer.

## Package Prefix Rules

**For Go packages:** Use at most two leaf segments of the path from the Go module root.

**Domain-specific prefixes:**
- `visibility:` — network-twin and visibility product features
- `segmentation:` — traffic-validator and segmentation features
- `all:` — cross-cutting changes, refactoring orthogonal to domain values
- `docs:` — documentation changes
- `x/library:` — specific shared library updates
- `v/vendor:` — vendor integration components

**Examples:**
- `visibility/activity` (specific package)
- `fingerprint/gsma` (specific package)
- `visibility:` (domain-wide change)
- `cmd/tool-name` (command-line tools)

**Common non-Go targets:**

**Module and dependencies:**
- `go.mod:` → "This change modifies module dependencies to..."

**Version control:**
- `git:` → "This change modifies git configuration to..." (`.gitignore`, `.gitattributes`)

**CI/CD and automation:**
- `github:` → "This change modifies GitHub integration to..." (`.github/` directory)
- `ci:` → "This change modifies CI configuration to..." (CI files outside `.github`)

**Build system:**
- `build:` → "This change modifies build system to..." (`Makefile`, build scripts)

**Tool configurations:**
- `golangci:` → "This change modifies golangci-lint configuration to..." (`.golangci.yml`)
- `prettier:` → "This change modifies prettier configuration to..." (`.prettierrc`)
- `docker:` → "This change modifies docker configuration to..." (`Dockerfile`, `docker-compose.yml`)

**Non-code directories (use first segment only):**
- `scripts:` → "This change modifies scripts to..." (`scripts/customer-a/` → `scripts:`)
- `github:` → "This change modifies GitHub integration to..." (`.github/workflows/` → `github:`)

**Documentation:**
- `docs:` → "This change modifies documentation to..." (`README.md`, `CONTRIBUTING.md`, `*.md` files, `docs/` directory)

**When in doubt:** Use the last two segments of the package path.

## 4. Verb Selection (Based on Git Diff Patterns)

**Core Rule:** Describe HOW the package changes, not WHAT you did as a developer.

**Fill in the blank:** "After this commit, the package now _____"

### Diff Pattern → Verb Mapping

| What you see in diff | Use verb | Package now... |
|---------------------|----------|----------------|
| New exported functions/types | **expose** | exposes new capability |
| New event/message handlers | **handle** | handles new input types |
| Improved existing logic | **enhance** | enhances existing behavior |
| Bug fixes in existing code | **fix** | fixes problematic behavior |
| New metrics/logging | **measure** | measures new data points |
| Deleted code/features | **remove** | removes old functionality |

### Good vs Bad Examples

✅ **Good (describes result):**
- `activity: expose UE state property` 
- `gsma: handle ComponentChanged notifications`

❌ **Bad (describes action):**
- `activity: add UE state property`
- `gsma: implement ComponentChanged handling`

## Body Content Guidelines

**Purpose:** Provide context for the change - decisions made, testing commands, left-over tasks, and reasoning.

**Include:**
- Key aspects of the change and reason for it
- Decisions made during implementation
- Commands used to test/verify the changeset
- Left-over tasks or follow-up work needed
- References to context for future readers

**Don't include:**
- Restating what the diff shows
- Listing files that were changed
- Implementation details visible in the code

**Example:**
```
visibility/activity: expose UE state property

This property will be used by the upcoming mobility tracking feature
to determine when devices transition between active and inactive states.

Tested with: go test ./visibility/activity/...
Still needed: Add property validation in the next commit.
```

## Issue References (Optional)

**Note for LLMs:** Issue references are optional - don't worry if you don't have them available.

**When available:**
- Embed references within sentences for context
- Use full form: `onelayerhq/roadmap#123` (not `#123`)
- Show relationship type: "Contributes to #123", "Following up on #123"

**Examples:**
- "As mentioned in onelayerhq/roadmap#123, we need to..."
- "This addresses the performance issue in onelayerhq/roadmap#456"

## 7. Special Cases
[Config files, build systems, documentation, etc.]

## 8. Generation Algorithm
[Step-by-step process for LLMs to follow]

## 9. Examples
[Good and bad examples with explanations]

## 10. Validation Checklist
[Final checks before committing]