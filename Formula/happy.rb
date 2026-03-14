class Happy < Formula
  desc "Mobile and web client wrapper for Claude Code and Codex"
  homepage "https://github.com/slopus/happy"
  url "https://registry.npmjs.org/happy-coder/-/happy-coder-0.13.0.tgz"
  sha256 "dee16a2425db6aa9db3bf017978075c8ec0984b971a864f6bfdaf7b58cc5a08c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/happy"
    bin.install_symlink libexec/"bin/happy-mcp"
  end

  def caveats
    <<~EOS
      To uninstall Happy:
        brew uninstall happy

      If you no longer need transitive dependencies like Node:
        brew autoremove
    EOS
  end

  test do
    assert_path_exists Formula["node"].opt_bin/"node"
    assert_match "Happy CLI Doctor", shell_output("#{bin}/happy doctor")
    assert_match "Daemon", shell_output("#{bin}/happy daemon status")
  end
end
