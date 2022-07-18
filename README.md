# portfolio-elm

<a href="https://github.com/gregoryalbouy/portfolio-elm/actions">
  <img
    alt="Build Status"
    src="https://img.shields.io/github/workflow/status/gregoryalbouy/portfolio-elm/Lint%20&%20Test%20&%20Build"
  />
</a>

:construction: **WIP** — Portfolio 2022, Elm SPA.

## Roadmap

In no particular order:

- **content**: update presentation (About), sort out irrelevant projects make detailed presentation for the remaining ones
- **UI**: responsive layout, projects list, sticky nav, maybe new design from scratch
- **refactoring**: Sass clean archi
- **dev**: find better workflow for pulling template repo updates (conflicts on ~every files)

## Get Started

### Commands

|  Command          | Description                                                                             |
| ----------------- | --------------------------------------------------------------------------------------- |
| `yarn build`      | Generates bundled build to `./dist` in optimized production mode                        |
| `yarn dev`        | Generates bundled build in watch and debug mode and runs dev server on `localhost:9999` |
| `yarn lint`       | Runs lint on Elm source files, using `elm-format` and `elm-review`                      |
| `yarn lint:watch` | Runs lint on Elm source files in watch mode, using `elm-review`                         |
| `yarn test`       | Runs Elm test suites                                                                    |
| `yarn test:watch` | Runs Elm test suites in watch mode                                                      |

## Stack

| Type              | Dependency   | Version |
| ----------------- | ------------ | ------- |
| App               | `elm`        | `0.19`  |
| Testing           | `elm-test`   | `0.19`  |
| Entrypoint        | `typescript` | `4.7`   |
| Bundler           | `esbuild`    | `0.14`  |
| CSS preprocessing | `sass`       | `1.53`  |
| CSS compatibility | `postcss`    | `8.4`   |
