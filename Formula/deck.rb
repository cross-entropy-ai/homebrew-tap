class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.4/deck-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "59f66ea05bd756e11e6c15ed48bf7003a9f4c9224df5c6175034293fe8000c34"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.4/deck-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "d8033b575679738e70737779ff39f214b148755aecd0dc0c4bda757fb6b89518"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.4/deck-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a1720e3a666d040db62cfb36e5df4137a9e1a7fad25a94c276efba5a3d1c818"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.4/deck-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4177e15769e8913274ba2628b2af866128c08b1f4d3897565d5d9fffd329fd34"
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
