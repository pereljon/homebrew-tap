class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.7.4.tar.gz"
  sha256 "5b5649bb137dd56037b8fa88dae988319fe2b96deab6d8b60f89608d28cea306"
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
