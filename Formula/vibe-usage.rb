class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0d4a1caff858ab775d7f07acbfbf440d65e7bcfcc939f4bf15b97f9679003b8d"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf8bde3094b748a1c7d225edcb3d0d50152e077dcbc49b0ce40b283afcac213c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e03b90ce1e33dec463e220fb6327725fbcb9f61d13706a0d729ebe1e57a1ed14"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7296ee025f2cd9de42e272a9afeb0d01346ac5e23b5e4c2bc3bbd8647b24f9f"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
