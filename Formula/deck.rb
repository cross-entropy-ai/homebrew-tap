class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.1/deck-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "1f072b476311fd3d262d434c941aa1b22d47b52da09b5c9ed607b14f581208d5"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.1/deck-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "d46d2052c4069160ce9e1e3393511b58633f8bf01eaf9a05b8ac1502bd0b7b37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.1/deck-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b480ebb111e8ff08c464fc8cc92b9d9f39151ec10864c69dd96a806e9b692ebd"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.3.1/deck-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "306be86037b39c880506d36b5e12d0288c5c6a73086b7eba483c7e2b0f399023"
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
