# cross-entropy-ai/homebrew-tap

Homebrew formulae for [cross-entropy-ai](https://github.com/cross-entropy-ai) projects.

## Usage

```bash
brew tap cross-entropy-ai/tap
brew install vibe-usage
```

Update:

```bash
brew upgrade vibe-usage
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [git-review](https://github.com/cross-entropy-ai/git-review) | Review branch and working-tree changes in your terminal |
| [webdrive](https://github.com/cross-entropy-ai/webdrive) | Browse and manage files over HTTP |
| [vibe-usage](https://github.com/cross-entropy-ai/vibe-usage) | Collect and analyze conversation data from AI coding tools |

## git review

```sh
brew install cross-entropy-ai/tap/git-review
git review
```

Upgrade with `brew update && brew upgrade git-review`.

Installs a precompiled binary for macOS or Linux on amd64 or arm64. Git is installed as a dependency; no Go toolchain is needed.

To update this formula, download `git-review.rb` from the desired [git-review release](https://github.com/cross-entropy-ai/git-review/releases), verify its checksum against the release's `checksums.txt`, and replace `Formula/git-review.rb`. Review, commit, and push the change manually. The downloaded formula already includes the version, tagged download URLs, and all four archive checksums.

## webdrive

```sh
brew install cross-entropy-ai/tap/webdrive
webdrive
```

Upgrade with `brew update && brew upgrade webdrive`. Installs a precompiled
binary for macOS or Linux on amd64 or arm64.

The [Sync webdrive workflow](https://github.com/cross-entropy-ai/homebrew-tap/actions/workflows/sync-webdrive.yml)
checks new stable releases twice an hour, verifies the published formula's SHA-256
checksum, and commits updates automatically. Maintainers can run the workflow
manually for immediate synchronization. It uses this repository's `GITHUB_TOKEN`
and requires no additional secrets.
