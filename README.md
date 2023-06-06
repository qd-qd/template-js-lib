# JS template

[![quality workflow](https://github.com/qd-qd/template-js-lib/actions/workflows/quality-checks.yml/badge.svg?branch=main)](https://github.com/qd-qd/template-js-lib/actions/workflows/quality-checks.yml)
[![unit-test workflow](https://github.com/qd-qd/template-js-lib/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/qd-qd/template-js-lib/actions/workflows/tests.yml)
[![Publish package to GitHub Packages](https://github.com/qd-qd/template-js-lib/actions/workflows/release-package.yml/badge.svg)](https://github.com/qd-qd/template-js-lib/actions/workflows/release-package.yml)

## Description

This is a template repository for bootstrapping a TypeScript library. It comes pre-configured with useful npm scripts and continuous integration (CI) workflows for quality checks, unit tests, and package releases. The repository is set up to publish packages to GitHub Packages, but it can easily be adapted to publish to other package registries like npm.

To use this template, simply click the "Use this template" button on the GitHub repository page and follow the prompts to create a new repository based on this template. Then, customize the repository to fit your needs and start building your library!

## How to adapt the template

Once you have created a repository based on this template, you will need to adapt it to fit your needs. Here are the steps you should follow:
- Update the name of the package in the [package.json](./package.json) file. Note that the name of the package must be scoped to your GitHub username or organization name. For example, if your GitHub username is `john-doe`, the name of the package should be `@john-doe/package-name`. It is required by the [release-package.yml](./.github/workflows/release-package.yml) workflow
- Run the installation command to propagate the name of the package in the [./package-lock.json](./package-lock.json) file. Follow the instructions in the [installation section](#installation)
- Update the description, the version, the keywords, the contributors list, the repository url, the bug url, and the homepage of the package in the [package.json](./package.json) file.
- Update the license in the [LICENSE.md](./LICENSE.md) file and in the [package.json](./package.json) file if needed. If you want to use another license, you can use the [choosealicense.com](https://choosealicense.com/) website to find the license that best fits your needs. Note that the license must be a [SPDX license identifier](https://spdx.org/licenses/). In any case, don't forget to update the year and the name of the author in the [LICENSE.md](./LICENSE.md) file and to adapt the [license section](#license) in this file accordingly.
- Go to the [settings of your Github account](https://github.com/settings/tokens?type=beta) to create a personal access token. Make sure to select the permissions listed below. Once create, copy the token, go to the Github repository of this project and create a secret named `RELEASE_TOKEN` with the value of the token you just created. This secret is required by the [release-package.yml](./.github/workflows/release-package.yml) workflow. Here are the **repositories** permissions required by the token:
  - Actions: Read and write
  - Contents: Read and write
  - Commit statuses: Read-only
  - Metadata: Read-only
  - Pull requests: Read-only

That's it! You can now start building your library. Refer to the sections below for more information on how to build, test, and release your library using the preconfigured tools.

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

### Git hooks

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

If you need to skip Lefthook on purpose, you can use the `CI=true` flag when running Git commands. For example, to skip Lefthook when pushing code, you can use the following command:

```sh
CI=true git push
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
