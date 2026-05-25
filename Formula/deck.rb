class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.0/deck-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b74040da7a06ec45aec9e21a8d5f7e55328cecc9de9731bac49e88f23a17779"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.0/deck-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f33410fe9a1efd746f0889a987e0c97b3e783f13b90e266ac36c0d6cc8388ed6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.0/deck-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f36ef338df68c3c5a4109bd0763e8d70a84c7eee72de98eea777b4ebeb033db2"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.0/deck-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1089b53e729d49ee27b5febaefd182c3ac1f1b2827fd167df12c6dcee930698e"
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
