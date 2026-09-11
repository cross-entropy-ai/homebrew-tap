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

Review branch and working-tree changes in a terminal UI:

```sh
brew install cross-entropy-ai/tap/git-review
git review
# Include staged, unstaged, and untracked changes:
git review -w
```

Until the first release, install the source version with `brew install --HEAD cross-entropy-ai/tap/git-review`. Homebrew installs Go for this initial source build. Stable releases install a precompiled binary for macOS or Linux, on Intel/AMD64 or ARM64.

Upgrade with `brew update && brew upgrade git-review`.

`Formula/git-review.rb` is updated automatically by the [git-review release workflow](https://github.com/cross-entropy-ai/git-review/actions/workflows/release.yml). Release setup is documented in [Publishing a release](https://github.com/cross-entropy-ai/git-review/blob/main/docs/releasing.md).
