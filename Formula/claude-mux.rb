class ClaudeMux < Formula
  desc "Persistent Claude Code sessions in tmux with Remote Control"
  homepage "https://github.com/pereljon/claude-mux"
  url "https://github.com/pereljon/claude-mux/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "4c65a3d58403e52ddf8a578d9b6eb2c43b66a1e4e6769b8cfb729633108893db"
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
