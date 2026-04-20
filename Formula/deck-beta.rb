class DeckBeta < Formula
  desc "Terminal sidebar for browsing and switching tmux sessions"
  homepage "https://github.com/cross-entropy-ai/deck"
  version "0.1.6-beta.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6-beta.2/deck-v0.1.6-beta.2-aarch64-apple-darwin.tar.gz"
      sha256 "439736f71748517ccffde7bf578af5b2183ebc093b82ad81bd5536c1139f2662"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6-beta.2/deck-v0.1.6-beta.2-x86_64-apple-darwin.tar.gz"
      sha256 "608f06620316ac96d73180ccb7eacc320aedfda809ba29f07b40505b4ba906f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6-beta.2/deck-v0.1.6-beta.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ab8a04b75e3ddcc214418e8ec9840694bfc925f8a134456b7cdea264beadbfe"
    else
      url "https://github.com/cross-entropy-ai/deck/releases/download/v0.1.6-beta.2/deck-v0.1.6-beta.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00f8363b5ea5965cd6fc3f3285fa49476b49d68353c9364f7fcb078281ff8445"
    end
  end

  depends_on "tmux"

  def install
    bin.install "deck" => "deck-beta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deck-beta --version")
  end
end
