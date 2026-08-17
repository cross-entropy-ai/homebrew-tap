class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3/deck-v1.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "3c9ccb0fc9a232859ded1157026cd2874a653944fba178e2c94e5a388857efe9"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3/deck-v1.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "db0e888ee7684e11d467506af91666cb6a715451a509f3f58ad7e66bd5f3dfd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3/deck-v1.1.3-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "bf0ccc82c474b76de79a42405ea2c70bbf20743beb621c63acc0da2a7913d5c1"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3/deck-v1.1.3-aarch64-unknown-linux-musl.tar.gz"
        sha256 "44efe8d0fbee4fc6bf9289fa814e796c0ac4c990414845ac365a47d75fe9f54e"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3/deck-v1.1.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e882b013dfb35cb1f63014b795b54f4c8b660da2f5467826bc270990fcbb349f"
    end
  end

  bottle do
    root_url "https://github.com/cross-entropy-ai/deck/releases/download/v1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "43df8d3a07179c8ebe7bd54a2fe16d01be22eb1aec7b2f3147a5a57452371a8f"
    sha256 cellar: :any_skip_relocation, ventura:       "6444fc8f5db6ef4b0bd7c363ceae47b4ec2d221fafa30d18fe4293bc4dc1f30d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "7a44125da581d622049636a389087c0f47b30e59abbb9ae282474290e135452f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a66cdefa38414aec488bc863bebcd888e3096f5e354ab242d63fab42a9986382"
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
