class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/f0/53/4afd2ba4e7a05ec33b4712806ed58237e565b8ab2ac505b94eef2d3ddcf9/open_agent_spec-1.2.8.tar.gz"
  sha256 "f4c6d8619dd30603ad2dcaf94c9c91841d5110c2a5cfb88d5b88b1b5f269bbf1"
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