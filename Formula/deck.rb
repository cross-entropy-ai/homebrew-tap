class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.2/deck-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "4ce010fc7c2f681ddaf1e758050f539b671d1470165d36d5644acd386a0d72ed"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.2/deck-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "6a945d405195d285af8bdb8c20c4bda1702b060ec926e9a5849ee5bbeb3d156a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.2/deck-v0.9.2-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "69df5f27853c7c79aed3c8a8adb46f08dc97182d931ee1557376b20b1ea7adae"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.2/deck-v0.9.2-aarch64-unknown-linux-musl.tar.gz"
        sha256 "966b7b76f1c724ff5e62abbe96526498edf4550acc7459427d0c33efa154d241"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.9.2/deck-v0.9.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1c9debfdff47de3046ca97c217f791cc13b68c652f6559e4692b6ee108770d0"
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
