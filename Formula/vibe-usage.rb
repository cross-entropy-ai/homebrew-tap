class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.10/vibe-usage-v0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "1527fce402e30c6dd7ff4574f4170b7ef0c773eac9b3f213e95e809a5f26f41b"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.10/vibe-usage-v0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "7604cf9499373532e4edf6a5730c39c67ec43ec3128b8876095e34adec4dcd2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.10/vibe-usage-v0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2121e8aa834e9689c227116c13a5d64a57b7ed986079af31b15c41245c8a3aa0"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.10/vibe-usage-v0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95db778d61e4d214620c88a0854a90574e7e550b87283317b2a874a453bfbe2"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
