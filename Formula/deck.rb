class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.8/deck-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "72c51a518e5a1d42f730f70b7d58b6db2b68f88c2768e233e560637ff3dd5e40"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.8/deck-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "da7916a2e7859c763e2234b122b66b8fa38a83243ee5db6ff3c2a8a4078b48a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.8/deck-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d7adb95019dd90e3064a415153ee38cff99256b34e02cabd90c0ae5956a27bb"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.8/deck-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3863d510882e3354437b3f91d62c36bb54643bc1c7c07c7575d0cab98d4d2a0d"
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
