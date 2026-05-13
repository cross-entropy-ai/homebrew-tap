class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.1/vibe-usage-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "bbb03425614904c74e3633b39b7153fd57558e83de6b604e1789b832707be906"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.1/vibe-usage-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "c4e40f089c5f2856b4d2b3222f0e997c10eea21460c3b9bcdcc307277f9ab12d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.1/vibe-usage-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a80ea71cd4146c36f6621e51e8ae1b7b67abe4516f053f0679e50edba27f9e50"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.3.1/vibe-usage-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ced83ff46bc0c0d97ee5691cbfd21945173fd029574452390ba7cb85d20b0cea"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
