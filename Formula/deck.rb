class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.0/deck-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "73e289dbb0df50edbca075d23e217183ef8fa0556f6ff07a85955d0f079730b6"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.0/deck-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "0bab053a4631a39c9eb0c96823469244740d8ad707af2d5ed42dcd81a4aedbe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.0/deck-v0.11.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "9de28e35ed65c9a89176eed4e03a502f8a8932aa11c904dde1825e6a546f42c2"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.0/deck-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "c4d8a888634e03d9f8cd08640c223285e85aff1bf3a2604e8b256864cc8ce9ab"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.0/deck-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1f08b282654734912ec2c6f556ab76a96bd1f5bdf8bd69249606536d34754f04"
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
