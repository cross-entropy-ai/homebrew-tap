class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.1/deck-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "c19385b2cbe548f006517a12f037b9f5721a72adcbeb0cc00a542997d3c6694e"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.1/deck-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "c203de502451052a2270a86782af462bd96079c7cac536f79bc98ecc738d1d2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.1/deck-v0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d504c16a12ac1c78cb9ebb37def4a74c240f860905f5c92b12aa428eb93928d9"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.1/deck-v0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3010c9ada29289ecb6d9a607ce489af8b88e7803e85c0273f7fcff042037b21a"
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
