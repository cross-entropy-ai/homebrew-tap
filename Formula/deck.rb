class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.11.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.2/deck-v0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "69e442b991bc673080fe92a356638db9976d348d5ba204ac562f346bf549e0de"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.2/deck-v0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "dbe5dd22a2414dbc3e69af6ffff1b010186c540e00761c0f7afcf655b88b6f8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.2/deck-v0.11.2-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "34b8e1ddf7b667f81ef73203b77f58d5ed34a0012dc345ac64a8de52e53d0d4b"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.2/deck-v0.11.2-aarch64-unknown-linux-musl.tar.gz"
        sha256 "a137c317973d43928d70802222263278a70ff17e8a3a995c4b335f3c06b6eb51"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.2/deck-v0.11.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f2fe9ad158cb21e662deb08ee4b71c13ef2739c4e8f43cd362febebeb1865a21"
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
