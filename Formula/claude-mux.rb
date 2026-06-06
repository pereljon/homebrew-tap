class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "b1f744947ac353facc630c3d010c86a1d4d71363bb9caccfc6fd24a59f0c94e7"
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
