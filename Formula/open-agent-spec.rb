class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/68/64/9b4485a3d8742befea4fffd4274821c7f0c6a98b1789c9033a15f5c01623/open_agent_spec-1.5.0.tar.gz"
  sha256 "b2ed6906d6c1d9411707447675cb87235152a2e67dc9a28109681aa1097da779"
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