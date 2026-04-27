class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6/deck-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "9d9b77856259e0a45577624bc1ea96278841d793394de0b1e1b637467bee0575"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6/deck-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "20b95f1dca603981a2c0774ba276ae68f43d418b6b157f7ecf589f82ad67a89d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6/deck-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a9a723093ecd97fd77dcff7da6fa0eaa40f3c5f803becf86567966a335b8f12"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6/deck-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0aa5ed99bfcb5b0523734c746d9a981309b15f5b47d5b9e29638fb1fe8dad896"
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
