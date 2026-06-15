class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.2/deck-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "def5ffc73e1e246ea3612bd4456cb8329bbc384768cdbb52453b873de764e8e8"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.2/deck-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "de2394d3dcdd3a7606c9a97130b61ddb517b009f40ab0ae8c735913f5556ec92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.2/deck-v0.10.2-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "c5f2ecc4546b7223089b873ab79b70c9081da1cce37b71c20b4cf9e4e213efb5"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.2/deck-v0.10.2-aarch64-unknown-linux-musl.tar.gz"
        sha256 "2c86f09aa7748f010054c1b1f404db8b1dadc51ecc984b2d1818b1355699381c"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.2/deck-v0.10.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "84508f5b3d40e78b5e3744c55cea96296988fa489d7ddbfcad76778a0b0b549d"
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
