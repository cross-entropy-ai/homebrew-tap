class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.2.0/deck-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "610fc5cfa35d5ea860f4322ed07170c92803f2587f8314b7e88107cc63cb5bfe"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.2.0/deck-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "b5edde634f5814f94a220e2c6e34486c4320373b97944d1e81b4df9807bbcaa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.2.0/deck-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "341c661c7f519dfee4e6b15c6d9ebdb14d48f8a917ac6ca136257dff81f38f36"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.2.0/deck-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5222d378d0d5db57400410ce51f65dc0bd91899686028f2c6ff59e759475b5ac"
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
