class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.11.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.5/deck-v0.11.5-aarch64-apple-darwin.tar.gz"
      sha256 "519014d749e8dcfce6f7fdcabe7320128c1df7e04768f6d507ab8a90ebfc7a5c"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.5/deck-v0.11.5-x86_64-apple-darwin.tar.gz"
      sha256 "e5ef673d2accc561a697c2efb480c14744a8be783f88ac543824765f439439d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.5/deck-v0.11.5-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "c9db50f560dafbc7a56d9fba06c1517d351d8c2bf9bd0754784e3b1407befedf"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.5/deck-v0.11.5-aarch64-unknown-linux-musl.tar.gz"
        sha256 "1ae170946984a9ee05a4e6aea2739463306bedda38a77422af1afa9cf2cc958e"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.5/deck-v0.11.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "304727b2eabb0aec0c3db5bc3fca05f6170f663dde984dc5a6cb0727b9f7d660"
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
