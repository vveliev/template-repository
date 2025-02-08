# How to contribute

This document standardizes the contribution workflow. It contains information
about *commit message formatting*, *code review process* and *best practice guidelines*.

## Table of contents

- [How to contribute](#how-to-contribute)
  - [Table of contents](#table-of-contents)
  - [Overview](#overview)
  - [Commit Message Format](#commit-message-format)
    - [Commit Message Header](#commit-message-header)
      - [Type](#type)
      - [Scope](#scope)
    - [pre-commit](#pre-commit)
  - [Code Review/feedback](#code-reviewfeedback)
  - [Attribution](#attribution)

## Overview

To smoothen everyone's experience with this repository, please take
note of the following guidelines and rules. There are three ways to
contribute to the repo:

- opening an issue
- opening a pull request
- providing a code review

## Commit Message Format

*This specification is inspired by and supersedes the [AngularJS commit message format][commit-message-format].*

We have very precise rules over how our Git commit messages must be formatted.
This format leads to **easier to read commit history**.

Each commit message consists of a **header**, a **body**, and a **footer**.

```text
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is mandatory and must conform to the [Commit Message Header](#commit-message-header) format.

The `body` is mandatory for all commits except for those of type "docs".
When the body is present, it must be at least 20 characters long and must conform to the [Commit Message Body](#commit-message-body) format.

The `footer` is optional. The [Commit Message Footer](#commit-message-footer) format describes what the footer is used for and the structure it must have.

### Commit Message Header

```text
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope: animations|bazel|benchpress|common|compiler|compiler-cli|core|
  │                          elements|forms|http|language-service|localize|platform-browser|
  │                          platform-browser-dynamic|platform-server|router|service-worker|
  │                          upgrade|zone.js|packaging|changelog|docs-infra|migrations|
  │                          devtools
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test
```

The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.

#### Type

Must be one of the following:

- **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
- **ci**: Changes to our CI configuration files and scripts (examples: CircleCI, SauceLabs)
- **docs**: Documentation only changes
- **feat**: A new feature
- **fix**: A bug fix
- **perf**: A code change that improves performance
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **test**: Adding missing tests or correcting existing tests

#### Scope

The scope should be the name of the npm package affected (as perceived by the person reading the changelog generated from commit messages).

The following is the list of supported scopes:

- `animations`
- `bazel`
- `benchpress`
- `common`
- `compiler`
- `compiler-cli`
- `core`
- `elements`
- `forms`
- `http`
- `language-service`
- `localize`
- `platform-browser`
- `platform-browser-dynamic`
- `platform-server`
- `router`
- `service-worker`
- `upgrade`
- `zone.js`

There are currently a few exceptions to the "use package name" rule:

- `packaging`: used for changes that change the npm package layout in all of our packages, e.g. public path changes, package.json changes done to all packages, d.ts file/format changes, changes to bundles, etc.
- `changelog`: used for updating the release notes in CHANGELOG.md
- `dev-infra`: used for dev-infra related changes within the directories /scripts and /tools
- `docs-infra`: used for docs-app (angular.io) related changes within the /aio directory of the repo
- `migrations`: used for changes to the `ng update` migrations.
- `devtools`: used for changes in the [browser extension](./devtools/README.md).
- none/empty string: useful for `test` and `refactor` changes that are done across all packages (e.g. `test: add missing unit tests`) and for docs changes that are not related to a specific package (e.g. `docs: fix typo in tutorial`).

### pre-commit

[pre-commit](https://pre-commit.com/) is configured for this repository, which you may
use to facilitate change submission, including commit message format checking.

First, install the `pre-commit` package manager locally using the appropriate
[method](https://pre-commit.com/#installation), then run `bin/install-hooks` in the
formula's root directory and now `pre-commit` will run automatically on each
`git commit`.

```console
$ bin/install-hooks
pre-commit installed at .git/hooks/pre-commit
pre-commit installed at .git/hooks/commit-msg
```

## Code Review/feedback

When providing a code review, don't be shy and consider the following checklist:

- [ ] Does the code satisfy the requirements?
- [ ] Is it error-free?
- [ ] Is the code tested properly?
- [ ] Suggest alternative implementations
- [ ] Ask questions if anything is not clear
- [ ] Prioritize your feedback
- [ ] Run the code!

## Attribution

This contribution is adapted from the Angular [CONTRIBUTING.md](https://github.com/angular/angular/blob/main/CONTRIBUTING.md).

Contributing Guidelines were inspired by
[saltstack-formulas/template-formula](https://github.com/saltstack-formulas/template-formula).
