class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "8789d96e2268e510d88717c7f06de412c3447a42f387befbee66f8109f7a903b"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "3e63c3a454eb4aa86e086e16a8f7041ba16ec11aa40befef2d73e108cfc53845"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc6923647b0e8fa3baf9286b23c75f85eb2a38b4fec8be531fa0684ccbb06eab"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ecafcf61c1bce61a1efe1cd46d0a25c3b1a623c43e05dfa478e868ad51ec052"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
