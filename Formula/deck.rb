class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.9.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.3/deck-v0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "4bc4aa7d1f862a9d508bf590921e0cf7595ae651d20cc391e26bb5b6ec7f3571"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.3/deck-v0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "1f60addda247600f5a7edd2bd92ec743a3e54d53b11ba82ff5fedde4056ae0f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.3/deck-v0.9.3-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "84c73b6f155aeb99b01735e57c17e80a2dc466e60376543bce3da4138c56b533"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.3/deck-v0.9.3-aarch64-unknown-linux-musl.tar.gz"
        sha256 "4345a68adbe26326ce176695531e4e0186bac8f72f69d7d695ba759adcc64781"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.3/deck-v0.9.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "54457fa35c4a95e58120c03e080f1bcef61b5888363d36f1c728b1d0b6a2d067"
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
