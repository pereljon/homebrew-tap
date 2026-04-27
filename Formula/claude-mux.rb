class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "a4acacca7912b15fa9079102f737b3465278f66e302100e04bf4d95e3c51aa7e"
  license "MIT"
  head "https://github.com/pereljon/claude-mux.git", branch: "main"

  depends_on "tmux"

  def install
    bin.install "claude-mux"
  end

  def caveats
    <<~EOS
      Run the installer for LaunchAgent and config setup:
        claude-mux-setup

      Or configure manually:
        mkdir -p ~/.claude-mux/templates
        cp #{opt_prefix}/config.example ~/.claude-mux/config

      Documentation: https://github.com/pereljon/claude-mux#readme
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-mux --version")
  end
end
