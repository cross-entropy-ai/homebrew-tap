class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.4.0/deck-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "ffaf9e52aa1f495920d143870439c3bcca88863717ca106108717a184ee0156e"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.4.0/deck-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "b6e927efd276a971dd7d29e46694b691cd31e1dae244db348b85cd4488dcfb59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.4.0/deck-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "271edbc2e2827790f135016a3449629cfdaff5ab5977e0d4ebb84988a61d86fd"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.4.0/deck-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b66bd1bcbfd18a1e8f11e8089dccc9c6271810099e4fbb332923e25872e905f7"
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
