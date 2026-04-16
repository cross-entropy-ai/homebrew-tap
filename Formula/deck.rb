class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.1/deck-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e91b899cf9f229d09e3e5b988c745f1ce21a8cf13331d10fa5a41ccf27214706"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.1/deck-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "28c0d7bc4bbc773b4d5b9f664108a6df5153aa912ee882421382cd405821e2fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.1/deck-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0d7b3e3b7cc51cb3c0aacbadeb0d9851f7b8274463bc38cdec9ed3751301484"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.1/deck-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0db9815bdb480718283149cc1727deb08a3d82ff6fdcdbadc6ae9882207d7116"
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
