class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.9/vibe-usage-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "11b2f03fcfca6d17b27fcd630a16406f46de1e72f5df8857045f95994f0a6e28"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.9/vibe-usage-v0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "8ef48d0d8eccb183c18afef46af358a26f0e6d4bde569631680cda91e5c4924a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.9/vibe-usage-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7f91c22f4bfb9963e434a99d79c4fed22288a1142f265daf36c6f7a0bacb4f1"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.9/vibe-usage-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "718c74d065e23473a6dd4b772da9dbf14a23ddea834bb3564f6f39d4f995f357"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
