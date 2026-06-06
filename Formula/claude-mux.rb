class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.14.1.tar.gz"
  sha256 "c17d6644b2f838dfe070320e2fb7ff2b60af27cf49b9ed859f84092a7346b4da"
  license "MIT"
  head "https://github.com/pereljon/claude-mux.git", branch: "main"

  depends_on "tmux"

  def install
    bin.install "claude-mux"
  end

  def post_install
    old_bin = Pathname.new(ENV["HOME"]) / "bin/claude-mux"
    if old_bin.exist?
      old_bin.unlink
      opoo "Removed old manually-installed #{old_bin} — Homebrew version is now in PATH."
    end
  end

  def caveats
    <<~EOS
      Run setup to create ~/.claude-mux/config and optionally install a
      LaunchAgent (home session at login):

        claude-mux --install

      Documentation: https://github.com/pereljon/claude-mux#readme
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-mux --version")
  end
end
