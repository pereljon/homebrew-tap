class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "2945a972c2f3c93b2c5af14d2db59760987b9361212e1a6cf0f5ad88a7833775"
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
