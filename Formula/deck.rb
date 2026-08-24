class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.1/deck-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "b11c708afa64a3e31cad6dbff2e0b28f6712d9446abe2c11ea4ac7702b5e9ddb"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.1/deck-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "dd8bdbf2cb6f9071db4a22c709746a792ef2e59ca11ffbf3a5c5cceb0748693b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.1/deck-v1.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1079f6cd64f1c52851a768d2d37a85ad9d15a47dc886e113c0994670bd1508c7"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.1/deck-v1.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7f34277d33b0a420e2d79a7a3c7416bdced43ec54832a020e8dc50247d35bde7"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "04f78e92c5f7cfca7048534b9eaec0bc2d8e583f03492b6ba43ab64f018ecfc7"
    sha256 cellar: :any_skip_relocation, ventura:       "76047bd21b7bb14edc187be98d7cea85b6f3a2869d5157b7d764b06ca4b0b34a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "f9ad3d7923a3208ee9054a430f92e3ad881164c93c94908277699afbae028613"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fd9ed67ab27f9a054dd933e101b9e7cde07007c7775cba566c67cafa0c6efc13"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
