# LLM Commit Message Guidelines for Go Projects

## Overview
Guidelines for AI assistants to generate consistent, idiomatic commit messages that match established team conventions in Go codebases.

## 1. Message Structure
```
<package>: <description>

[optional body]

[optional trailers]
```

## 2. Subject Line Format

### Package Prefix
- **Rule**: `<package>: <description>`
- **Length**: ≤ 72 characters total
- **Package naming**: [specific rules based on codebase analysis]
- **Colon**: Always followed by single space

### Description Format
- **Tense**: Present tense imperative
- **Case**: Lowercase after colon
- **Punctuation**: No trailing period
- **Style**: Describe what the change does, not what was done

## 3. Package Naming Rules
[Specific rules for determining package prefix from file paths]

## 4. Verb Selection
[Guidelines for choosing appropriate action verbs]

## 5. Body Guidelines
[When to include body paragraphs and formatting rules]

## 6. Trailer Guidelines
[Issue references and other metadata]

## 7. Special Cases
[Config files, build systems, documentation, etc.]

## 8. Generation Algorithm
[Step-by-step process for LLMs to follow]

## 9. Examples
[Good and bad examples with explanations]

## 10. Validation Checklist
[Final checks before committing]