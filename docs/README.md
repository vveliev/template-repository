# Github Repository template stencil

## Feature

- pre-commit validation to improve code quality validation
- semantic-release configuration
- github actions
  - pre-commit check for pull requests
  - github action for publishing release
- vscode dev container with all required packages for pre commit

## Usage

To set up a new project using this template, run the following command:

```sh
make setup DEST=../someProject [TOOLCHAIN=toolchain_name]
```

- `DEST`: The destination directory where the template files will be copied. This can be an absolute or relative path.
- `TOOLCHAIN` (optional): The name of the toolchain configuration to use. If specified, the contents of the `.vscode/{toolchain_name}` folder will be copied to `DEST/.vscode`.

### Example

To set up a new Svelte project:

```sh
make setup DEST=../svelte-project TOOLCHAIN=svelte
```
