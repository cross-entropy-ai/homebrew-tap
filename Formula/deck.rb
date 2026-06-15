class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.10.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.3/deck-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "268bc2a20b21f8952029cbc416e1f697a8916a494655581cd24d995cac023d26"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.3/deck-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 "a55e27a384ba66d9554eec983db83b541c70670b7dc4e09f90ad6282354eae53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.3/deck-v0.10.3-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "7c874fba0006421b1087a182ecfb9d2c65bedda1ac7aff6225e867701efe4cfd"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.3/deck-v0.10.3-aarch64-unknown-linux-musl.tar.gz"
        sha256 "8d128343b44dffe51dd830eb784da400145ea30db6086c73873ec4d46fe4ef1d"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.3/deck-v0.10.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "10e745eddf233116ed6ff82e24ad7f756901955aa69701ecaa3d32ee66588e17"
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
