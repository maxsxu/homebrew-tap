# Homebrew tap

## Install Kux

```sh
brew install maxsxu/tap/kux
kux --demo
```

Kux currently lives in a private GitHub repository. Your Git credentials must have
read access to `maxsxu/kux`. For example, configure GitHub CLI authentication before
installing:

```sh
gh auth login
gh auth setup-git
```

The formula builds from a pinned source commit using the checked-in `Cargo.lock`.
Homebrew installs Rust as a build dependency and `kubectl` for Kux's describe, edit,
shell, and port-forward features. The first build can take several minutes.

To install the latest development version:

```sh
brew install --HEAD maxsxu/tap/kux
```

## Maintain the formula

Homebrew packaging lives in [`Formula/kux.rb`](Formula/kux.rb). To publish an update,
set `url`'s `revision` to the full Kux commit SHA and `version` to the version in that
commit's `Cargo.toml`. If the package version is unchanged, increment the formula's
top-level `revision` so `brew upgrade` detects the update. Reset that top-level
revision when the package version changes.

Validate changes in a local checkout of this tap:

```sh
brew style maxsxu/tap/kux
brew audit --strict maxsxu/tap/kux
brew install --build-from-source maxsxu/tap/kux
brew test maxsxu/tap/kux
```

Use `brew reinstall --build-from-source maxsxu/tap/kux` if already installed.
