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
| [vibe-usage](https://github.com/cross-entropy-ai/vibe-usage) | Collect and analyze conversation data from AI coding tools |

## git review

```sh
brew install cross-entropy-ai/tap/git-review
git review
```

Upgrade with `brew update && brew upgrade git-review`.

Before the first release is added here, use `brew install --HEAD cross-entropy-ai/tap/git-review` to build from source. Homebrew installs Go for that source build. Released versions install binaries for macOS/Linux on amd64/arm64.

To update this formula, download `git-review.rb` from the desired [git-review release](https://github.com/cross-entropy-ai/git-review/releases), verify its checksum against the release's `checksums.txt`, and replace `Formula/git-review.rb`. Review, commit, and push the change manually. The downloaded formula already includes the version, tagged download URLs, and all four archive checksums.
