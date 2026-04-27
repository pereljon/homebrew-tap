class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.7.3.tar.gz"
  sha256 "91e3eb1e820ee2220e2d44271209e01b7371df81d3c57ba6e843731a340e5e31"
  license "MIT"
  head "https://github.com/pereljon/claude-mux.git", branch: "main"

  depends_on "tmux"

  def install
    bin.install "claude-mux"
  end

  def caveats
    <<~EOS
      Config (~/.claude-mux/config) is created automatically on first run.

      For LaunchAgent setup (home session at login):
        git clone https://github.com/pereljon/claude-mux.git
        cd claude-mux && ./install.sh

      Documentation: https://github.com/pereljon/claude-mux#readme
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-mux --version")
  end
end
