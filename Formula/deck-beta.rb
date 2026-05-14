class DeckBeta < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.9-rc1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9-rc1/deck-v0.1.9-rc1-aarch64-apple-darwin.tar.gz"
      sha256 "8cfb6bf4396299d32f8edcf6c4147fe5b515a4573738c469d0dd8febc39a1470"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9-rc1/deck-v0.1.9-rc1-x86_64-apple-darwin.tar.gz"
      sha256 "06f2090c5527766aff792647bff3272e36dec046aa21890c22b594d7e5087d29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9-rc1/deck-v0.1.9-rc1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0352d75963858db37f10c89ceeb139fd181c6eebf43a20a997d4bd43375c11d1"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9-rc1/deck-v0.1.9-rc1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9477ff87c24bb776d66e0fe3b5236020b725b58c8a2023d3d36c8f6fcfca7034"
    end
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck-beta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck-beta --version")
  end
end
