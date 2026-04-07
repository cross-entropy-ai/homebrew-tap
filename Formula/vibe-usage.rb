class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.1/vibe-usage-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "d042f6e5774dbb157f371cee76a027dd6f6d137649a28bd9a2d7e502d719c526"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.1/vibe-usage-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "28ae8e44869e6c96e9eded58a2705faa0d52e15064118fc2369e8630be8babc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.1/vibe-usage-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f63a62dbdb38020a8c3e57a62ecb8cb991641eb3f662e26ab68075fed9c07be3"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.1/vibe-usage-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9dfca9639aa879c2011705681a574d93c1217599267e321f71107c52e824c91"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
