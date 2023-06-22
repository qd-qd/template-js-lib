# JS template

[![Open in Github][github-editor-badge]][github-editor-url] [![Github Actions][gha-quality-badge]][gha-quality-url]
[![Github Actions][gha-test-badge]][gha-test-url]
[![Github Actions][gha-release-badge]][gha-release-url] [![ts][ts-badge]][ts] [![License: APACHE-2][license-badge]][license]

[github-editor-url]: https://github.dev/qd-qd/template-js-lib/tree/main
[github-editor-badge]: https://img.shields.io/badge/Github-Open%20the%20Editor-purple?logo=github
[gha-quality-url]: https://github.com/qd-qd/template-js-lib/actions/workflows/quality-checks.yml
[gha-quality-badge]: https://github.com/qd-qd/template-js-lib/actions/workflows/quality-checks.yml/badge.svg?branch=main
[gha-test-url]: https://github.com/qd-qd/template-js-lib/actions/workflows/tests.yml
[gha-test-badge]: https://github.com/qd-qd/template-js-lib/actions/workflows/tests.yml/badge.svg?branch=main
[gha-release-url]: https://github.com/qd-qd/template-js-lib/actions/workflows/release-package.yml
[gha-release-badge]: https://github.com/qd-qd/template-js-lib/actions/workflows/release-package.yml/badge.svg
[ts]: https://www.typescriptlang.org/docs/
[ts-badge]: https://img.shields.io/badge/Built%20with-Typecript-3178C6.svg?logo=typescript&logoColor=white
[license]: ./LICENSE.md
[license-badge]: https://img.shields.io/badge/License-APACHE2-pink.svg

A Typescript-based template for developing Typescript libraries, with sensible defaults.

## Description

This is a template repository for bootstrapping a TypeScript library. It comes pre-configured with useful npm scripts and continuous integration (CI) workflows for quality checks, unit tests, and package releases. The repository is set up to publish packages to GitHub Packages, but it can easily be adapted to publish to other package registries like npm.

To use this template, simply click the "Use this template" button on the GitHub repository page and follow the prompts to create a new repository based on this template.

## What's Inside

- [Parcel](https://parceljs.org/): Blazing fast, zero configuration web application bundler
- [Jest](https://jestjs.io/): Delightful JavaScript testing framework
- [Rome](https://rome.tools/): Unified developer tools for JavaScript, TypeScript. Used for linting, and formatting.
- [Lefthook](https://github.com/evilmartians/lefthook): Fast and powerful Git hooks manager for any type of projects
- [nvm](https://github.com/nvm-sh/nvm): Node Version Manager

## Sensible Defaults

This template comes with a set of sensible default configurations for you to use. These defaults can be found in the
following files:

```text
├── .gitignore
├── .npmignore
├── .nvmrc
├── .jest.config.mjs
├── lefthook.yml
└── rome.json
```

## Installation

This repository uses [npm](https://www.npmjs.com/) to manage dependencies and run scripts. To install the dependencies, run the following command in the root directory of the repository:

```
npm install
```

This template can easily be adapted to work with others package registries like pnpm or yarn.

## Building the project

The project uses [parcel](https://parceljs.org/) to build and bundle the code. To build the project, you can use the following command:

```sh
npm run build
```

## GitHub Actions

This template comes with GitHub Actions pre-configured.

- [quality-checks](./.github/workflows/quality-checks.yml): runs the build command, the linter and the formatter
  on every push and pull request made to the `main` branch.
- [tests](./.github/workflows/tests.yml): runs the tests onsevery push and pull request made to the `main` branch.
- [release-package](./.github/workflows/release-package.yml): creates a new release every time you push a new tag to
  the repository. This action is only triggered on tags starting with `v`. Once the release is created, the action is
  also in charge of deploying the documentation to the `gh-pages` branch. **THIS ACTION NEEDS AN ACTION FROM YOUR SIDE
  TO WORK**
- [tests-coverage](./.github/workflows/tests-coverage.yml): runs the tests and generates a coverage report on every pull
  request made to the `main` branch. A comment is posted on the pull request with the coverage report.

You can edit the CI scripts in the [workflows directory](./.github/workflows).

### Configure the release action

The release action is in charge of deploying the documentation to the `gh-pages` branch. To do so, it needs to have a
personal access token with the right permissions. To create this token, go to the
[settings of your Github account](https://github.com/settings/tokens?type=beta). Make sure to select the permissions
listed below. Once create, copy the token, go to the Github repository of this project and create a secret named
`RELEASE_TOKEN` with the value of the token you just created. Here are the **repositories** permissions required by the
token:

- Actions: Read and write
- Contents: Read and write
- Commit statuses: Read-only
- Metadata: Read-only
- Pull requests: Read-only

## Git hooks

This project uses `Lefthook` to manage Git hooks. Git hooks are scripts that run automatically when certain Git events occur, such as committing code or pushing changes to a remote repository. `Lefthook` makes it easy to manage and run any type of scripts.

After installing the dependencies, you can configure the Git hooks by executing the following command in the project directory:

```sh
npm run hooks:install
```

This command installs a Git hook that runs Lefthook before pushing code to a remote repository.

Once the hook is installed, it will automatically run Lefthook before pushing code to a remote repository. If Lefthook fails, the push will be aborted.

To run Lefthook manually, you can use the following command:

```sh
npm run hooks
```

This will run all the Git hooks defined in the [lefthook.yml](./lefthook.yml) file.

### Skipping git hooks

If you need to skip the pre-push hook instaled by lefthook on purpose, you can pass the `--no-verify` flag to the push command. For example:

```sh
git push origin --no-verify
```

## Testing

The unit tests are located at the root of the `tests` directory. They are automatically run by GitHub Actions on every push to the `main`/`prod` branches and on every pull request that targets the same branches. They are also automatically run by the git hook on every push to a remote repository if you installed it ([refer to the Git hooks section](#git-hooks)). Finally, you can also run them locally by executing the following command in the project directory:

```sh
npm run test
```

For you information, [Jest](https://jestjs.io/) is already configured as you expect it. Nothing else is required to run the tests.

## Quality

For the quality, this template uses [rome](https://rome.tools/). It is a linter, and a formatter. It is a single tool that unifies many of the tools you already use. It is designed to replace ESLint and Prettier. Rome already works as expected, the configuration is located in the [rome.json](./rome.json) file.

To run the linter in check mode run the following command:

```sh
npm run lint
```

To run the formatter in check mode run the following command:

```sh
npm run lint:format
```

Finally, to run the linter and formatter in write mode run the following command:

```sh
npm run lint:write
```

## Node version manager

This template uses [nvm](https://github.com/nvm-sh/nvm) to manage the Node version. It is configured to use the version specified in the [.nvmrc](./.nvmrc) file. The version has been set to the latest LTS version. If you and your contributors use nvm, you can simply run the command below in the project directory to use the correct version of Node. Read the [nvm documentation](https://github.com/nvm-sh/nvm#deeper-shell-integration) if you want to automatically use the correct version of Node when you enter the project directory.

```sh
nvm install && nvm use
```

## Contributing

Refer to the [contributing guidelines](./CONTRIBUTING.md) for more information.

## License

This project is licensed under the [Apache License 2.0](./LICENSE.md). You are free to use, modify, and distribute this software under the terms of the license. See the [LICENSE.md](./LICENSE.md) file for more details.
