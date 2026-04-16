class VibeUsage < Formula
  desc "Collect and analyze conversation data from AI coding tools"
  homepage "https://github.com/cross-entropy-ai/vibe-usage"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.8/vibe-usage-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "bbcbc7fa9b795bf20beda5a99d812015ce5534d539cbe0a21a79896746b365ef"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.8/vibe-usage-v0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "93cf1e7252dd0f577d1f5eb32c2884f498f11e03c3277166bea0a30448b0baee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.8/vibe-usage-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2455df263be0b0754454b717bfc1069703cdc0e6a0c69f2caaa4583f732c5f7"
    else
      url "https://github.com/cross-entropy-ai/vibe-usage/releases/download/v0.2.8/vibe-usage-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3259f7e87d66e2596ad0864fb17b0ce0be548f29420dc265c5b3099c55ff68e"
    end
  end

  def install
    bin.install "vibe-usage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vibe-usage --version")
  end
end
