class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.0/deck-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "8949486c1feeb45238fc046c1f5771c414fb6757c957bdf1cca79a99de5a71a7"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.0/deck-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "506d432ffc59c5eb2ac91efeba558f13b6d66d9c9024af8ced5f2ea8ae48d2a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.0/deck-v0.10.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "360a039195597c02dc700b9180eeff61f7a308900285d9237b9f09e8cbe12f2a"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.0/deck-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "099157d7bfb809a22b766c9ae82383890984280ccc457e6510f031f361f1969f"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.10.0/deck-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fb994bf7e5a89bb4f86e165ce994ec5a5d7fee579a5f61f4bcdec379915cca5a"
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
