class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.0/deck-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6b9c1c3f08a708767d1db55ec8a2c236b6ee43f7d6f08b4260878dc7cdcab752"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.0/deck-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5939edbb49905772942daa1ef99a69535ef732e790f2875c323041e83f98fd6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.0/deck-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6449438b4a232e09e6a1e27c82299439f2a0fa4a7e017856940f8a7c834fffa"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.0/deck-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f604781a6eadc6a03c0e0a8f5ff5fb8e8adfd3efaff1ff72717a89906af31ce6"
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
