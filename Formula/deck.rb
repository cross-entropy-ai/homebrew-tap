class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.11.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.1/deck-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "492dea9c30cdd5b4fed36613ed811054ba90d579706258c63d1e3aaf2fa6238e"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.1/deck-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "7dde324702dd2cf528d4b149f1ded108110358915b54204d0a8b77f3a1e8eae9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.1/deck-v0.11.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "fad52e2b56f269614b2b985b69ec5c9dbe1e3d15c701df5d5f813606f71ee86e"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.1/deck-v0.11.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "5641b5aecdb24daa3bf0a3692d1f497e773da96bbfd01b470f9bdc63f5a74b03"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.1/deck-v0.11.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a793fec68a1bfc00cd78cf6afa269b0f73bd82ef2cc56c7ac30e38bb62dcf84"
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
