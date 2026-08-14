class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.0/deck-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3edd49b6d802197e76dc0a1cdb8193f23375dbda7f0c2dab780e618e71132c06"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.0/deck-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "37bb9f3846752c6e86db4268f1dc56f9ff4b18461dc6cb67ddf3d28c24328693"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.0/deck-v1.1.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "150a306ee27ccfd209b63a67a4e25e4c07e08110ddbef6fc1b7cd97cfbcda058"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.0/deck-v1.1.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "6f42471f7ce16457a2a777f6a97b1cee5eca0bb66f2be51c879488d7165e4502"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.0/deck-v1.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7b5c45add0df0811aa414dd3e00b98d866593d2d0c76878b740fd4fc83d4eee7"
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
