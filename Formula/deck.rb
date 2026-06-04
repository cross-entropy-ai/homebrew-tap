class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.0/deck-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "f889394aaef1b9b6ad7befc99aa6d00fb650119ed2e6621e9b26ed4953ba6c8b"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.0/deck-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "3da760793495b3feb6dbf83af87015532cd650460b20d05fd21c990cd808c7d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.0/deck-v0.8.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "2ad5550fc3eb3038ecff8391c9266459b014da51590fbc873cfee38e8ce8b57a"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.0/deck-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "2867842fa33b9f342f9354eaaf8afb91a8f6c85e9e7ee61ecc9e3b55937c6d54"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.0/deck-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c6a762f458647c4d2c4ab4fe5a89da0879cc2668b56ed37fc82da8108d6a09e"
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
