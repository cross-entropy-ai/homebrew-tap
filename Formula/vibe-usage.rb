class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.0/vibe-usage-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "32093d7e12cc3f2576f455ebaeee537becd4aa7b2e044ded368e006fd9442079"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.0/vibe-usage-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "eaa4a76f376b2ffd7a22cd7778e52d6fe937ad5436bccb1bb0aa2c5dede22529"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.0/vibe-usage-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d63ae8f4a741c2e7e48510502b09755e2e07546c4f142ade62265f175234de0c"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.0/vibe-usage-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46dfc966a08ff149852b3461149b78b604086516c3779e2b0e299b64eb4b368c"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
