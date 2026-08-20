class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5/deck-v1.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "8f704c602a4a2620817126dc2b3365810d7624543ccae42f68c52f4d6cbec547"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5/deck-v1.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "0b1ee3c749ec92993f4ff89047ccf794300bfd41772098b2ee20000c8f76be9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5/deck-v1.1.5-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "3a2011ac2122f274bfeb1e0f98f2953e108a6c91b57a184427f4b72d5fcf84c4"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5/deck-v1.1.5-aarch64-unknown-linux-musl.tar.gz"
        sha256 "3ca4b01f82d658f74e1f651d9008952793b9a33953c63135fa6152a2a2adcf9e"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5/deck-v1.1.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e5bfb0c4aa21efd8928a5e9e46fbc08e2727069331bf7a80be44ed04282cdb3"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "bf187671d24f8cc0c0bc6396213c9d4caea99565ec9fc04edcd7f475b78460ce"
    sha256 cellar: :any_skip_relocation, ventura:       "71e5a97b8c22153015782c4b88d5ed6f508e1cd4cc3871b3d474e3d6d8a89b21"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "34d026d49c558f4fcf25c1fe393f9c7f7e5820f6fcb0e2b7821acac2b7fc8cc5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f8ed7cb74a6e8f54930f6f8cbf6a9830fd798af1ee8bdf80b749d0aba5e98861"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
