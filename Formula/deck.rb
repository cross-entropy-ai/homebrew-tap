class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.0/deck-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7808d614ff5a970db2609cd204d8e7d91c32b6496f9a679c3d078c0c1bd4c64c"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.0/deck-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "743afaa3af45a07f1f872a6d68de735c6dac4b218e9249c3767ff384895f1357"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.0/deck-v1.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b8d0dace5c70cfbc3d34b24afbeb138f7258c47ffd37564ca374ad27c0b67093"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.0/deck-v1.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0dd058361401242eae523ef9d15ccc7127254fa8c2ea952b4c3a28827d890441"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9de79bb76912f48cb57cd9486bcefd1ab266e18657c6cc0146b7977391f2e6b2"
    sha256 cellar: :any_skip_relocation, ventura:       "d38e555e960aa5b79f0e9e34fe537d67e58c6b0079bd8503e23041bd993d2fab"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d9da0149ea6806f2644259f9ba656673d8ba17b7f4f0c2b491dd0cd9296595e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "101f15a0e372ded354869f66b61bce09824bc1e8a0be3c4a1826a3e82e65657b"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
