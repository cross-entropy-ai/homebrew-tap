class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9/deck-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "5598bb474f71ab69b15e3e6afd63fb03004b9bc7822241dcbd7ce0cd424de406"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9/deck-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "5e38743b491ac6ab0143d554f3341a4e75ef5ea676ba61cd8f4b2e41a0d16ecc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9/deck-v0.1.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51604bf7e9a007c0d8505bb4693b4727f8eebd62ea7a7ef926d05584f0f00c22"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.9/deck-v0.1.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29e9ee893c6d1f3311b83fc4cee4bfe3f7f41e4b561733cabb22c6f83ab5064e"
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
