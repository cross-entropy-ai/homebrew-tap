class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.0.0/deck-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "15051c26136e5125159de718d7e1260c251c759df9cbb2d0ec2f533c1d15492f"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.0.0/deck-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "b8c9c87590eccee535d3c701745d929a0e7e61e9ec035fd66d52ed853d3c0c24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.0.0/deck-v1.0.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "f3262e95134a67c8d21c57bbcce5fd5efd261c8b303b9a776291c82eb821d9a1"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.0.0/deck-v1.0.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "4ef5e17e0b43c08a2f8dc13a176bad5f0f8a4e93731f834b8cf57dfcd0b7e9a1"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.0.0/deck-v1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e983eb4ee431f913aecc1f1ffbc7873dcde3ad4739fdb4a15bb06e7a74fdb1e"
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
