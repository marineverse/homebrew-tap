# MarineVerse Homebrew tap

Install the open-source [MarineVerse CLI](https://github.com/marineverse/marineverse-cli) on macOS or Linux:

```sh
brew install marineverse/tap/marineverse
marineverse --help
marineverse globe races list
```

Homebrew installs Node.js and keeps the CLI isolated from your global npm packages. Choose either Homebrew or npm to manage the `marineverse` command.

To update:

```sh
brew update
brew upgrade marineverse/tap/marineverse
```

Windows users can install Node.js 24+ and run `npm install -g @marineverse/cli` in PowerShell.

## Maintaining the formula

After publishing a CLI version to npm, update the formula's exact registry tarball URL and SHA-256. Verify the downloaded tarball against the npm release integrity, review its contents and dependencies, then run:

```sh
brew install --build-from-source marineverse/tap/marineverse
brew test marineverse/tap/marineverse
brew audit --strict marineverse/tap/marineverse
```

The formula uses npm's published build output and Homebrew's isolated npm installation helper with lifecycle scripts disabled. Tests run offline and never access MarineVerse accounts or change boats. GitHub Actions checks fresh installations on macOS and Linux.

The packaged CLI is licensed under Apache-2.0. See its bundled LICENSE and NOTICE.
