class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.3/deck-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "6cf009994f15d562b355c2fe7c90dc4802d09d67d12532e1eec04cd4f7df342d"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.3/deck-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "ab6f84173962f327544208b90d1d4c9a633fbb13e0f9563325c95d93fe83ce0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.3/deck-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12f56c9d8264994c81cd0a7df73be4868431d2dc910fcd6eaa87a55be75a5262"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.3/deck-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "330917199a8958fa09e1eb8c696ef626569c804b864fa46f7834a6ed0b8a046d"
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
