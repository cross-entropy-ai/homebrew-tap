class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.9.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.4/deck-v0.9.4-aarch64-apple-darwin.tar.gz"
      sha256 "98dd9d71b009247f6ec2318125132a464bb98ccdfb98aac5662d9c421b2c54ee"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.4/deck-v0.9.4-x86_64-apple-darwin.tar.gz"
      sha256 "ed73bc776d2ce3fbe90af517d6eb2a36ae3187906322c33f7434bc693735dfef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.4/deck-v0.9.4-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "491f6054779cc73e615e888f5884c82521841e53e405973cd837b8f1e1fdfeca"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.4/deck-v0.9.4-aarch64-unknown-linux-musl.tar.gz"
        sha256 "59948f6a2578fe422c4a68a6a50ed9f0f1d16a33396e6de9bf3990968a7ce7c3"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.4/deck-v0.9.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0bec9076f8a1410ef2229e4d10a3fe6d60d383905d10ca9c1db8853c5ae47a1b"
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
