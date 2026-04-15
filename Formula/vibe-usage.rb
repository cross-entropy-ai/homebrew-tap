class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.5/vibe-usage-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "e56d0ed7d50cff400e155150a9a4ade27ac745e78d0eac45077cf6e2b3feecb2"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.5/vibe-usage-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "3b7ec51d9179ddf2781ba8810c20de79790a2b20f7da7cbc75200922c64b1132"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.5/vibe-usage-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae1d7d25db181d184e99106256f6f7033e9e9b8fd53b7680e07f7a4938167dfa"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.5/vibe-usage-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5b5a29fc22dfa7b6c31698161d40f2c9b11476401bd4d49f95424891214a0d8"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
