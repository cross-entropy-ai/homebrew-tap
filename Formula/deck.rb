class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.1/deck-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "da290f04e9ba651142f303be2b41ef37bed7f8abccc9ea18d1f07c0fad27a19d"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.1/deck-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "c9712f9a3f1e1c03c5216cb12861e7cdb2f3b35871a03ce582b273f64163d1e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.1/deck-v0.7.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "6246aad6c4106222d3cf12e680e9d3119716696b3e2aa6fda0753a034e6aed12"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.1/deck-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "c1eaebb6b3d6a98d63da804f12fdc3d263e344f01935d71b6f5544c47e9e54c0"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.7.1/deck-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "53b43f4db5e2ae18e7606d7f37398b18f07dd9f406e67ca22c63ab26a445806a"
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
