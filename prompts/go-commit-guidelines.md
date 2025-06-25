# Go Commit Message Guidelines for LLMs

**You are an experienced Go developer and commit message expert.** You understand that commits tell the story of the codebase and should be informative, concise, and well-structured. You analyze code changes to write precise, intention-revealing commit messages that describe HOW the code changes, not what the developer did.

> **Purpose:** Enable LLMs to generate commit messages that match established team conventions. Commits should tell a coherent story, not track the actions of a developer.

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
- Strives to be ≤ 72 characters total (no hard limit)

**Key Principle:** Describe HOW the target changes, not WHAT you did as a developer.

## Target Identification Rules

### Go Packages (Most Common)

**Rule:** Use at most two leaf segments of the path from the Go module root.

**Examples:**
- `visibility/activity` (specific package)
- `fingerprint/gsma` (specific package)  
- `cmd/tool-name` (command-line tools)

**Domain-specific prefixes for cross-cutting changes:**
- `visibility:` — network-twin and visibility product features
- `segmentation:` — traffic-validator and segmentation features
- `all:` — cross-cutting changes, refactoring orthogonal to domain values
- `x/library:` — specific shared library updates
- `v/vendor:` — vendor integration components

### Documentation (Second Most Common)

**Rule:** Use `docs:` for all documentation changes.

**Files that use `docs:` target:**
- `README.md`, `CONTRIBUTING.md`, `*.md` files
- `docs/` directory and contents
- Any documentation-focused changes

**Sentence completion:** "This change modifies documentation to..."

### GitHub Integration (Second Most Common)

**Rule:** Use `github:` for all GitHub-related changes.

**Files that use `github:` target:**
- `.github/` directory (workflows, templates, etc.)
- GitHub-specific configuration files

**Sentence completion:** "This change modifies GitHub integration to..."

### Other Common Targets

**Module dependencies:**
- `go.mod:` → "This change modifies module dependencies to..."

**Version control:**
- `git:` → "This change modifies git configuration to..." (`.gitignore`, `.gitattributes`)

**CI/CD (outside GitHub):**
- `ci:` → "This change modifies CI configuration to..."

**Build system:**
- `build:` → "This change modifies build system to..." (`Makefile`, build scripts)

**Tool configurations (named after CLI tool):**
- `golangci:` → "This change modifies golangci-lint configuration to..." (`.golangci.yml`)
- `prettier:` → "This change modifies prettier configuration to..." (`.prettierrc`)
- `docker:` → "This change modifies docker configuration to..." (`Dockerfile`, `docker-compose.yml`)

**Non-code directories:**
- **Rule:** Use first segment only
- `scripts:` → "This change modifies scripts to..." (`scripts/customer-a/` → `scripts:`)

### Decision Algorithm

1. **Is it a Go package?** Use two-segment rule or domain prefix
2. **Is it documentation?** Use `docs:`
3. **Is it GitHub-related?** Use `github:`
4. **Is it a known target type?** Use specific rules above
5. **When in doubt:** Use the last two segments of the path

## Verb Selection (Based on Git Diff Patterns)

**Core Rule:** Describe HOW the target changes, not WHAT you did as a developer.

**Fill in the blank:** "This change modifies TARGET to _____"

### Universal Verb Mapping

**For new exported symbols in Go packages:**
Look deeper into the changeset to find the appropriate functional verb:
1. **Check if there's new functionality** - look for actual implementation, logic, behavior
2. **If functionality exists** - find the verb that describes what it does:
   - Read function names (e.g., `HandleEvents` → **handle**)  
   - Check doc comments for functionality descriptions
   - Review package-level documentation updates
   - Examples: **handle**, **measure**, **transform**, **parse**, **validate**
3. **If no functionality** - just exported declarations (types, vars, interfaces):
   - Use **expose** when adding new types/interfaces prior to their usage
   - Use **expose** when making existing unexported symbols public

**For CLI tool-related changes:**
When changes relate to well-known CLI tools, consider using the actual command as the verb:
- `go.mod: tidy` (from `go mod tidy`)
- `go.mod: get example.com` (from `go get example.com`) 
- `go.mod: upgrade example.com to latest release` (from `go get -u example.com`)

**For other changes:**
- **enhance** - when you see improved existing logic  
- **fix** - when you see bug fixes in existing code
- **remove** - when you see deleted code/features
- **test** - when you see new tests added
- **configure** - when you see configuration changes
- **bump** - when you see dependencies updated (fallback if CLI verb doesn't fit)
- **update** - when you see content/text changes

### Target-Specific Adaptations

**For Go packages:**
- Focus on functional changes derived from the functions in the changeset.

**For docs:**
- Focus on content: `update`, `clarify`, `add`, `remove`, `restructure`

**For github:**
- Focus on automation: `automate`, `configure`, `update`, `fix`, `enhance`
- For specific workflows: `build`, `test`, `push` (images), `deploy`

**For go.mod:**
- Use specific verbs: `tidy`, `get`, `add`, `remove`

### Good vs Bad Examples

✅ **Good (describes result):**
- `visibility/activity: expose UE state property` 
- `docs: update installation guide`
- `github: add workflow for testing`
- `go.mod: bump golang.org/x/sync to v0.14.0`

❌ **Bad (describes action):**
- `visibility/activity: add UE state property`
- `docs: write installation guide`
- `github: create workflow for testing`
- `go.mod: update golang.org/x/sync to v0.14.0`

## Body Content Guidelines

**When body is needed:**
- The one-liner alone doesn't provide sufficient context for review or future understanding
- Think: "Will this be clear when someone runs git blame in 6 months?"
- The one-liner is read while scrolling through logs; the body is read during review and debugging

**When body is optional:**
- Commit is self-explanatory from the one-liner and diff
- Simple, straightforward changes with obvious motivation

**Format rules:**
- Use plaintext only - NO Markdown (terminals, Git UIs don't render it)
- Line length: 72 characters max, break lines as needed
- Use paragraphs to logically segment content - helps readers focus on distinct points
- Separate paragraphs with blank lines

**Content to include (contextual information NOT in the diff):**
- **Motivation:** Why this change was necessary
- **Decision rationale:** Why one approach over alternatives
- **Timing context:** What this leads up to, what comes next
- **Validation:** Tools/commands used to verify the change
- **Follow-up work:** TODOs, next steps, known limitations

**When uncertain about commit details:**
Use the body to ASK the developer questions. Format them to clearly demand attention:

```
QUESTION: Should this validation also apply to legacy devices?
QUESTION: Is the 30-second timeout sufficient for production workloads?
TODO: Confirm error handling strategy with @teamlead
```

**Don't include:**
- Information visible in the diff itself
- File listings or implementation details
- Markdown formatting

**Example:**
```
visibility/activity: expose UE state property

This property will be used by the upcoming mobility tracking feature
to determine when devices transition between active and inactive states.
The property design follows the same pattern as existing state tracking
to maintain consistency across the visibility package.

Tested with: go test ./visibility/activity/...
Next: Add property validation and update documentation.
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

## Real Examples from Production

### Go Package Examples

**Simple functional change:**
```
defrag/sctpdefrag: log progress for debugging
```

**Complex functionality with body:**
```
defrag/defragtest: adapt templates for complex (multi-layered) protocols

This change enhances the fragment handling logic by allowing templates
to return multiple layers, which is essential for protocols requiring
additional encapsulation.

The documentation has been updated to clarify the behaviour of the
fragment rendering process and to provide examples of how to implement
protocol-specific fragmentation.
```

**Documentation-focused Go package:**
```
defrag/sctpdefrag: document the package and its fragmentation process

This long doc contains snippets from the spec and references to the
official RFC.
```

**Performance optimization:**
```
defrag/sctpdefrag: efficiently decode chunks with BundleContainer
```

### Documentation Examples

**Content update:**
```
docs: reformat how-to-use-labels.md
```

**New content:**
```
docs: describe deployment artefacts
```

### GitHub Integration Examples

**Configuration change:**
```
github: trick Dependabot into setting GOPRIVATE
```

**Workflow addition:**
```
github: label Dependabot pull-requests with "dependencies"
```

**Content correction:**
```
github: correct release notes to highlight Dependabot updates
```

### Go.mod Examples

**Dependency upgrade:**
```
go.mod: bump github.com/testcontainers/testcontainers-go/modules/redis
```

**Intentional downgrade:**
```
go.mod: downgrade testcontainers to v0.19
```

## 10. Validation Checklist
[Final checks before committing]
