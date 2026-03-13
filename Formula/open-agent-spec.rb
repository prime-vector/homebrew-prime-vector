class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/6e/cc/db2861662d4f40262b535554a87c94d00424d24a1c43f9c5bb81d7cd1ea0/open_agent_spec-1.2.4.tar.gz"
  sha256 "10e01dc2a02393d30ae764f4251f588cbf633a5636e8563664d9511225a9b0ab"
  license "MIT"

  depends_on "python@3.12"

  def install
    system "python3", "-m", "pip", "install", "hatchling"
    system "python3", "-m", "pip", "install", "--no-build-isolation", *std_pip_args, "."
    generate_completions_from_executable(bin/"oa", shell_parameter_format: :typer)
  end

  test do
    system "#{bin}/oa", "--help"
  end
end