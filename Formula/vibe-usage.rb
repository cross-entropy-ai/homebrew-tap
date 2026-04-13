class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.4/vibe-usage-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "08d0336011ecb9269483165fd7ea45d7d91046ad23d33f74e16ee8a37e87da90"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.4/vibe-usage-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "933a2c906aa571d7fd409825c63f76d61ec11b1fa7e798ffe4a83f6848a7eb88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.4/vibe-usage-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9ea1ee1bfaf640b94c21526621ac6fca89653b0ec2c1c8dc2db1d9dd39851e2"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.4/vibe-usage-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d47a818c7f8836fb81e435cfa9eea788ab98be6747ea663361081128ed4e94f"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
