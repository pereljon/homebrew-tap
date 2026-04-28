class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "2c9608b0461470c5b4a2d67eeb27cbd832d23cc7ed7a2137ecc092cd36b63a23"
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
