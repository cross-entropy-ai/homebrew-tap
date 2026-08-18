class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4/deck-v1.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "4137698f6b78656690793c416900f94e0e2984ded501eca2631852d1aa5d3b04"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4/deck-v1.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "85d565c9f33c1e6e2b642c737c5f21e312dd54a2e862bb4e12f53a78679c694c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4/deck-v1.1.4-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "815cfddfa9cb840a25a86c82d82bdf872119dda36aae6ee795b73535143743e4"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4/deck-v1.1.4-aarch64-unknown-linux-musl.tar.gz"
        sha256 "1b1d9ffc471c40caa4332f1e1433a166960a2253fdd69f83c6bd91b4d4e39be6"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4/deck-v1.1.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f43e906a0c8b3a913b148c81d8163003fae18c353cca0a3539aabf8c12b1d102"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "424ac4a9ecbdf154bad88b1286e273f826662851411dce6521a37612852df814"
    sha256 cellar: :any_skip_relocation, ventura:       "eb475288d3849e45e96eaf485825a73152423c8dc62bcc72ede898c8f57d3be9"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "f4cf96cb3a7c415921548b60b918babc25ad0c9fdee431bef8643eddec876fc6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dcbaf6153e395aee5ef98f34ff1c588abc8fa44e42aaaffe58552b1d17196b74"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
