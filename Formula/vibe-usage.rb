class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "103433e909ed70b5a1530a998b0c85d8a15dd5f4280d9623433254892841400a"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "05964613edb6511ff1e8a6b6c553d44891448ed5d6f942f8a24920f9bc90e866"
    end
  end

  on_linux do
    url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.0/vibe-usage-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45feed7c632f3ba62a69879cd6a3055059f7b70976d0b834cc8103d5299cf52f"
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
