class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.0/deck-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "b9861b8ca7d726b9c428e9b436c9e3772e829b8be5ce31167bc7cf3a48dded28"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.0/deck-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "cbc4614211e47282716857d47fcd7a7b7e31cb3f586f71da9b020c353977681a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.0/deck-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c6d11d097358ec6f320e8eeff9d79d906881f7116743950541abae8095ebe804"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.0/deck-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "17911df1b19a72d53dc1485e77f53ebb825a630c6d01c62fdf7ae0f28faccc60"
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
