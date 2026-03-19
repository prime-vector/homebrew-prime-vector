class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/0c/80/43e50367c0a918c0b1c52816d4dc66db5caf5f41d211024580cf3489fe9b/open_agent_spec-1.2.9.tar.gz"
  sha256 "846f43cf1f5c50213e5f5848aa1beaf984e93e8bb8d2d43e87c61956411a3e2d"
  license "MIT"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    system python3, "-m", "venv", "--without-pip", libexec
    system python3, "-m", "pip", "--python=#{libexec/"bin/python"}",
           "install", buildpath
    bin.install_symlink libexec/"bin/oa"
  end

  def post_install
    # Skip Homebrew's dylib ID fixup for Python native extensions (e.g. jiter)
  end

  test do
    system "#{bin}/oa", "--help"
  end
end