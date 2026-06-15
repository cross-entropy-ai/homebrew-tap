class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.1/deck-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "891169eb3c6a3852cebda63148917d4dacf98e66d5f8f9ccc6c2b8b78ff43ba0"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.1/deck-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "72a68d5bc7a58cd0af89504db250d4848c4a40abff5b0ad82ad7df92dbfb84bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.1/deck-v0.10.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "16d1741b5513e8922eb14eaf30bda11d62e074eac4339bde557645355caa5134"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.1/deck-v0.10.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "35b068c4a74cb4ce8d37ffd8e26ec8107025a1bce45f061161b8447934a77b83"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.1/deck-v0.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ad3e0ca387ee7e8383458ac812422abf8a978343de243efe1251b8fa13a490d3"
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
