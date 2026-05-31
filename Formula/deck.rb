class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.2/deck-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "e9286b3a98d0d41f6759baf8c6f8ae2576392a1690eb90ca726137e918df12d6"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.2/deck-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "6be43228b6b120aff92ddc0fc6d9382f14bfbdf6041dde697d02ff082eef3802"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.2/deck-v0.5.2-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "6951ba8f9da138e04191e8741e7762ba11695e1ee903547bb3055299aae867bf"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.2/deck-v0.5.2-aarch64-unknown-linux-musl.tar.gz"
        sha256 "daad9a09ebc3ace9990196b4f546b4e41404f18fd1216f303cc24983be0e9f99"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.5.2/deck-v0.5.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4de62a9641fe34c9c56f8069f5695282a9d1b9487ffc37965f63356210a0560"
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
