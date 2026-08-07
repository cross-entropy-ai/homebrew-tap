class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.11.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.4/deck-v0.11.4-aarch64-apple-darwin.tar.gz"
      sha256 "e0444a283e49123e306055440a6b7df1caea0ad73937ecb528575ea9fd1c55e9"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.4/deck-v0.11.4-x86_64-apple-darwin.tar.gz"
      sha256 "1fc2529ca89e096f2c928eaa1bd9adadd6f3b175225095b7fa45517138b90908"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.4/deck-v0.11.4-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "d9a009764769849dde6ed4ac5fffd00b280b5808a1877dfb9f1551b793d2c2a3"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.4/deck-v0.11.4-aarch64-unknown-linux-musl.tar.gz"
        sha256 "58b6cb107970fbf7c884d98f3b0bcde06271a5ef4c160d37a43979bfceec4299"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.11.4/deck-v0.11.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78ffe11935d9d8ea80af4f83aacbbe8f2d8c0c7be5e71e40efb824b6c446c6ee"
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
