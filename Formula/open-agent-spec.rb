class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/6e/cc/db2861662d4f40262b535554a87c94d00424d24a1c43f9c5bb81d7cd1ea0/open_agent_spec-1.2.4.tar.gz"
  sha256 "10e01dc2a02393d30ae764f4251f588cbf633a5636e8563664d9511225a9b0ab"
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