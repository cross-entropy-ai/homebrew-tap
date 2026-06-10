class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.1/deck-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "8ec9b9468fe5363fabcc5fd982a7722ebe12085ab278585513ada368bc7ffc85"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.1/deck-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "3146b368125b36cf50cd2cc39fbd82b27e237f0852329ac8275b356d8b34fe5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.1/deck-v0.9.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "6fc5154ca1edc123eaa5fac1135b189ed18d9d46533afce0859099af1c1bda76"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.1/deck-v0.9.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "664046e894f52acb965f469a89ced2aa7296dff5a97e3d7e3903202ba5168ac5"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.1/deck-v0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "871447e6fc3ee78867c28d452ddf779e07b2acdc67333ef977bd5fb1c9f4bfc0"
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
