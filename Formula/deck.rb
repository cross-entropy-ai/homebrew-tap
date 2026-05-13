class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.7/deck-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "fac6400f2b53f6522cb8c7453ebae3229e7c725f6a08309e44a29faf4f780c5d"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.7/deck-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "0cd6a52dcc755f16d18aacdadd77aebe34845c3066e6a9e734dd8b7c803c1aab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.7/deck-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb4afa62cc01b57993ca3b15caf9f5e3ee5cdfc87f4ea21dc07d025fa22d6263"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.7/deck-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "177e3c05447dc9c491c199aab72bcb65f028590aa1dcf6d5a52f527b2c400d69"
    end
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
