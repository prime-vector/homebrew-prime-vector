class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/ed/26/6e61d09c8cc0b1af4d6f4e1cc493573d7143fd856ca64b207aaed1ebc596/open_agent_spec-1.2.5.tar.gz"
  sha256 "da741ffebf2cab3efce13358a56186c593cc72a01aa84b20478dc45f6515f8c0"
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