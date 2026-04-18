class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.5/deck-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "6bdff3c9aafcadb33aedca53e533d4454b8d377ae95ceb73f56dcec0b5448abd"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.5/deck-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "a7020f86a1421163c5b8f7e7ccb0259df660d5cc2db1b1a3decf002ac1e5cf44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.5/deck-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ec2e94b819cd42fe1f436853d4a7c52cd9390f4df2dc4d519f245cb61c86a2b"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.5/deck-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc50a89400cfd7837f116040dcc6987d76476d395f3815ff74a36384691f47ab"
    end
  end

  depends_on "tmux"

  def install
    bin.install "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
