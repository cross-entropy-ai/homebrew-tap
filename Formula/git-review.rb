class GitReview < Formula
  desc "Review branch and working-tree changes in your terminal"
  homepage "https://github.com/cross-entropy-ai/git-review"
  head "https://github.com/cross-entropy-ai/git-review.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=HEAD"), "./cmd"
  end

  test do
    assert_match "git-review HEAD", shell_output("#{bin}/git-review --version")
  end
end
