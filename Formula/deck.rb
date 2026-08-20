class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6/deck-v1.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "7b44dde8d2651ffce49d628f65105464cd5e25f1824e47bc4e6cecbfbafd5ef1"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6/deck-v1.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "32e0a9c25040066893bac6b2b6eaebf98fe9b5f80c90754c3c98bad78a4507e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6/deck-v1.1.6-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "98d14a99503031ef63cf54fe76950d67bcaa9c49d308710729f122ea99cf9a83"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6/deck-v1.1.6-aarch64-unknown-linux-musl.tar.gz"
        sha256 "ffaa441547c93f123ff20d2eb4b236eee4966b5432535275e032e65f404ac275"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6/deck-v1.1.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "318601bddb4231995778851ffd34cb28e5f3c7035b7aaffef82cef496fe39921"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "83e963e49d760bf5646ee032e9363c65d655e85db1c6a567d6c9b0daf9d0bc6e"
    sha256 cellar: :any_skip_relocation, ventura:       "01009ce10c9fce232b33a3d4c7935b109c6b667e8d6e55f0e0f0f40b9b67d9ec"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5c59bb8fe321f9613d9cc046481e4532d0065049d7f5bb3252cd6387d1853d6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "96b80dfff1bcf8b4f08997a53bf38a9da8d13a9d967b3fc8630a98cd17c34e7e"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
