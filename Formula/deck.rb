class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.1/deck-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "eea00bd6dc9b1246a922301f564122b9b4365c5707ea63c08dc2cb80623b7559"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.1/deck-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8454c8bf320f2d74d2ecba057b126d254bb99ae1072753835ac38d5b0e42e9a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.1/deck-v1.1.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "449159176ef7e75390005b12ae9aa30d00b91fe6c0ae6b650c3fd5c06cf3173e"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.1/deck-v1.1.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "7b67582bec363d2d94f02b1c1b83682d22174458231971552bcee36226d81773"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.1/deck-v1.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b09a6ec67c162ed6ad7a3b22939fc88ccc7ab8829030ab20c6f0fcced1993c7e"
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
