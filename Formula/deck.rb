class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.2/deck-v1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "8520be9492bbf65c57c7f70f7d781d0411a61ba70dc9bfab43267e401a8e812f"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.2/deck-v1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "a0c1716516c011e8fc86c9ab6d455416aca541c952080be717e8cd627551dfde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.2/deck-v1.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "00b0d9ee5674a5c8c95a3a56008d37615f44e4f83eaafc79500ed96ef2b19096"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.2/deck-v1.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d07329c1c0cd4d9cc8bca5a34c837ec7a7ade9a8142926ecb24f359f955af223"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8869fc298c961fdae01a2309adfda20aae826c002144c89750e0ebefc7d636db"
    sha256 cellar: :any_skip_relocation, ventura:       "419e12db987afad3e501e374b1c410e604cbf94e29e183dc0f5427cf58c9c667"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e061d597eb6c61fa140fe584c82495c2ecdf4cede8a538b0df6b6cb4e3aecfae"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e02ec41959f8991d4d739b756fe39bf130d067294292ef13753f0c578d9b377c"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
