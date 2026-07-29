class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.10.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.4/deck-v0.10.4-aarch64-apple-darwin.tar.gz"
      sha256 "89c637c594ce6ca9e11b455f85b4d60a9d2377e94dd5c504fb8caf5abb6834e0"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.4/deck-v0.10.4-x86_64-apple-darwin.tar.gz"
      sha256 "f8c4f5ec9c45c70ae46145ab2bee4e3eb72c228f468dbb48fd1b515f7bf3a8d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.4/deck-v0.10.4-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "bf16da43770e9080dbe05ace20434ebe59b49599fd83149a52dc6be374cf2771"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.4/deck-v0.10.4-aarch64-unknown-linux-musl.tar.gz"
        sha256 "664608ee79943bb1ab68c9656803caa13365e477fd755ff177630461a46e1473"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.4/deck-v0.10.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "addff4591175b7596b18b768ed7bc05964125da7c33dd1e79a856009a5a6910f"
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
