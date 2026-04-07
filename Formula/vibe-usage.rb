class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.2/vibe-usage-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "041b76a999107b2a92b91f48a44bd1df54c68f5b3a7fe2c2815ecbcb2fd9c9d6"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.2/vibe-usage-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "2536a9ebc06c7b9ac5ac747e83b6dec22eb44148551bd7dc55b5ec8205600a51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.2/vibe-usage-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "612be0be1723efd23a5b5245030ade1647e58889870306914295155419d3fe27"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.2/vibe-usage-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "725ca2acb8d34809334751a07ac49003208728f084b98d47c82bbc23c6760865"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
