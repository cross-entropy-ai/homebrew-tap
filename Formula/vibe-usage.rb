class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.7/vibe-usage-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "c61aa7709b26d6d541dc4a0f17677b816498844713ea4da3b6f90daa359188d6"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.7/vibe-usage-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "2f7d5ad460c66456f5379427fce8b9269f465afcac599a51d6549b693efa198a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.7/vibe-usage-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ba37e4d69acb8bb848ce1a0223ed3f1a4a249133e9bab846e14150ae2f32126"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.7/vibe-usage-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6424aa17d935ff1364465c59c9bb944153ed78c52ac06f91bd8c2244c832dbde"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
