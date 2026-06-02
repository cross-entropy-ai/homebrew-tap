class Deck < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.6.0/deck-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca7c99b221c4f9f0d7bdf73b85781aacf6a8157e348acb4e9dba8ddee1432c3d"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.6.0/deck-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "a183283bf7137fb577343c03f06439a6005533efbb0cd1903ac4ca6ddc00f61e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.6.0/deck-v0.6.0-armv7-unknown-linux-musleabihf.tar.gz"
        sha256 "f8de12814ae2b9879f3459c6fd851ccb2fd9ad6bde98346ec292580cca45082c"
      else
        url "https://github.com/cross-entropy-ai/deck/releases/download/v0.6.0/deck-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "c2a3b836b28d4110f4bba626f7674a9f208b5902fab33196e1c933d916a653c3"
      end
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.6.0/deck-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "304a69cc8f694bf4c0e89593febec51109afd13871dd11b17c9d7975ec49934c"
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
