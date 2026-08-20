class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7/deck-v1.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "68bbde3f98d898b827eee81df6856969ecff48ceff01dc3b0a9adb40508c03f9"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7/deck-v1.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "dc41f27268c31234200431e82fe95b488da4a84bad34907d4f4e987ecc2567cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7/deck-v1.1.7-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "bf3510cf3e953b6e0d760cda2c1afc7c9fc09db8f1e7d38a41804c99c6dc6c7d"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7/deck-v1.1.7-aarch64-unknown-linux-musl.tar.gz"
        sha256 "a7622a30cb777a6cd29119b78774687593fa3502b46a671f20d299b4b9ab6c7d"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7/deck-v1.1.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a6ac9bb294e39db6c4a388dc0fca1779f8be8132c55b2af951fd62d87e3e4bb"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.7"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "254f105c8e3183fd157ecf018c2110c117eb1d9945ce1b949bbf2d1e38174e61"
    sha256 cellar: :any_skip_relocation, ventura:       "52c75fe6995aac54911c127f510984c7c8579548f70082c49ec8433545637827"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "9ffbfb3d5f463b40f495df8ae4581b96e35ff668ec078f370c7146bd1941e8ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3a28f0eadd56542359c1fdc42bc2903eba2c7e343b2ab9f924157496fa3ebadd"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
