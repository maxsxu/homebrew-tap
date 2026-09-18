# Homebrew tap

Homebrew formulae and casks maintained by [maxsxu](https://github.com/maxsxu).

## Installation

Install a formula directly using its fully qualified name:

```sh
brew install maxsxu/tap/cloudsmith
brew install maxsxu/tap/kux
```

Alternatively, add the tap once and install packages by name:

```sh
brew tap maxsxu/tap
brew install cloudsmith
brew install kux
```

## Available formulae

| Formula | Description | Version | Definition |
| --- | --- | --- | --- |
| `cloudsmith` | Cloudsmith command-line interface | 0.32.0 | [Formula/cloudsmith.rb](Formula/cloudsmith.rb) |
| `kux` | High-performance Kubernetes terminal UI | 0.1.0; development builds with `--HEAD` | [Formula/kux.rb](Formula/kux.rb) |

### Cloudsmith

The formula installs the [Cloudsmith CLI](https://help.cloudsmith.io/docs/cli/)
in a Python virtual environment. Homebrew installs Python as a dependency.

The formula currently has a placeholder test (`system "false"`), so
`brew test maxsxu/tap/cloudsmith` will fail until that test is implemented.

### Kux

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

Try Kux without connecting to a cluster:

```sh
kux --demo
```

## Available casks

This tap does not currently contain any casks.

## Maintenance

Formula definitions live in [`Formula/`](Formula/). Keep the catalog above in sync
when adding, updating, or removing formulae or casks.

### Updating Kux

Homebrew packaging lives in [`Formula/kux.rb`](Formula/kux.rb). To publish an update,
set `url`'s `revision` to the full Kux commit SHA and `version` to the version in that
commit's `Cargo.toml`. If the package version is unchanged, increment the formula's
top-level `revision` so `brew upgrade` detects the update. Reset that top-level
revision when the package version changes.

### Validating formula changes

Run checks from a local checkout registered as `maxsxu/tap`. For example, for Kux:

```sh
brew style maxsxu/tap/kux
brew audit --strict maxsxu/tap/kux
brew install --build-from-source maxsxu/tap/kux
brew test maxsxu/tap/kux
```

Use `brew reinstall --build-from-source maxsxu/tap/kux` if already installed.
