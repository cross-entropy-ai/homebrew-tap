class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.1/deck-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "e6eb2b4bab8277ae82e11b42474814b0aa70603b65ff22e0c29fa84b4f4c51c3"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.1/deck-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "7a8ff5364b9a986ef8a0a52939e293d6494be9c985e6ceac727c146fd53c072c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.1/deck-v0.8.1-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "623af94a70b93615210c694a9709426cdc1313c1eca15ce94e62f5ad67301651"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.1/deck-v0.8.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "7e0df72651d60c07922a2111730a70b01f1e691a11834ae48bb7a91ba5519df8"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.8.1/deck-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "98c11da1947f5bc7085aff6994abbd4411dff55e6472ff161d9f97592348cc6e"
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
