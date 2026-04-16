class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.2/deck-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "fedb2c8bc75cf8a0b9ed7a1828371ff3d60012ec21149e76168fe821ad50ab23"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.2/deck-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "0ca1601f808a3b64e64bc33fe4226f52b18778206a74e4da7581483ba9fe8e68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.2/deck-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b17c751aad13bf21291bb147c0068a5c774b147838eb9171bb44a6e5d4469422"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.2/deck-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e62ef90b661b71c4f8060fab8c1f51ba95469e0f29b02748c2bec7bbbfd985d"
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
