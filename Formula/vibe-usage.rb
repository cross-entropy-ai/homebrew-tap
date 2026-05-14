class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.4.0/vibe-usage-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "43e168526d8c22a86ae84b93436b4996f99f2a1c4a8e2060a473ed41d507699e"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.4.0/vibe-usage-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3a423f83af0cbc9f1b70ce2626724ce9c48aa88b5ef9d5ab50df7adce916396"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.4.0/vibe-usage-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff7b406c742742701bb12a334d385294a7191ae0e85d59821ff617fc1010de37"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.4.0/vibe-usage-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d10ec51dab6f1acf89695bd914769bf73cc3b5305279185c900debd1a22968fb"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
