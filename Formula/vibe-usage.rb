class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.6/vibe-usage-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "5eb92f0348e86ea6db0ac7e04ccbb4cd01ac8a60022b09fd8b04ca77d92d18ac"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.6/vibe-usage-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "60583e114e67db9821981103d17454e11d5ad4ed2b3c2bf2e5765e242757beb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.6/vibe-usage-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0e86e697d304fade1207852c1e1dcc9dcd2164d60a63a8eebfaa2d569366257"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.6/vibe-usage-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75035ea64cef9eb5c071e5c4b8a14da5b552267a75c7fd9b87d324092cdde6db"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
