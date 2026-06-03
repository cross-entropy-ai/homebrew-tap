class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.0/deck-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "739c535c758f7597eab80d30ab4bca6429b9b94780ea1c86f8f532a7af3002b2"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.0/deck-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec9f04dad5cdee9e40fbed7ad88f34a6fe638ad396c2db462e22543c7abc33a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.0/deck-v0.7.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "857db7ccaf8e7041f2a1e782f4023be64f49cd7337e85b33e74760389737b523"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.0/deck-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "169dfb3e1b6c563eabe58520ee6012fbd2de3f174d49d693b05aaaed4ea21209"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.0/deck-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d0024b49cff65df2646abac6a0650a9581a21966e4046f0cc439504dcdb6aca5"
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
