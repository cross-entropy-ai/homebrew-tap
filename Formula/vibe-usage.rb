class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.3/vibe-usage-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "551c50e47ece37d12629c0d7e4b5977c55f189ab520530c6a69f3ffbf118d09d"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.3/vibe-usage-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "c899f4894539502a7e836c16c80f47bef5f6ce6dc99cbc475ccaad34f8947277"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.3/vibe-usage-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da78787b9035ee583260ec0d852ff0732a2a1c48ff4429527d1a1ea50b21ed8f"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.3/vibe-usage-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cf0ec7f4f332a9b8a205c310e173a9baf86c5da99f8e1a7c280e097f14b82d3"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
