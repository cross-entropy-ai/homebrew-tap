class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.2/deck-v1.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0bfc58d3d1659429b26930a0d2c04de7e1312d979d6a23098be118087f4c2a6f"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.2/deck-v1.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "e8742a939299ad142475ed99a4dd28ce3bebdcc0a87095834c6782babfead4b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.2/deck-v1.1.2-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "7e27e39de2f04e8d42a91ff2513c07170dcf95c768b3f2482d1659c32b3976b5"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.2/deck-v1.1.2-aarch64-unknown-linux-musl.tar.gz"
        sha256 "00797ad494070ff3a12457ec452d732930989c1e896bd0f486688cf39afdbf7a"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.2/deck-v1.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33063dd40d9ff4eb88d16e02f4383b0af2ba780db1e8ea8fa67a470d4dfd911e"
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
