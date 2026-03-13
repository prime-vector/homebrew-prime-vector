class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/6b/65/10e01dc2a02393d30ae764f4251f588cbf633a5636e8563664d9511225a9b0ab/open_agent_spec-1.2.4.tar.gz"
  sha256 "10e01dc2a02393d30ae764f4251f588cbf633a5636e8563664d9511225a9b0ab"
  license "MIT"

  depends_on "python@3.12"

  def install
    system "python3", "-m", "pip", "install", *std_pip_args, "."
    generate_completions_from_executable(bin/"oa", shell_parameter_format: :typer)
  end

  test do
    system "#{bin}/oa", "--help"
  end
end
