class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "37b1530e1623f3ea621e954678df304be2dbba47a64fddaee15c4663fa2f41f7"
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
