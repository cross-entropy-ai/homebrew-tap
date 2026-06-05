class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.0/deck-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "3c960ea98c1a92a10ee687a778183ab8d7abe93a38a0ef6541f55770eb24e179"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.0/deck-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "77b2def3a980e98e08f805d22dc43930073d886b4e862b322080e1eeccce05c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.0/deck-v0.9.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "02dd5bc6c78da216a86ccdc12c27f323677ebfedfcf76ccb54803910549f74cc"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.0/deck-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "afe41a1e4390aa2854656df62e0fbe5659fda7e4106916faeb72f11b0e69dc67"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.0/deck-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1a7e30df1399acffec112be7adef577c5a274ecaa59b4ea225e6078c343fa290"
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
