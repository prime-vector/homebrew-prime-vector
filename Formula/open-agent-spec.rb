class OpenAgentSpec < Formula
  desc "CLI for creating and running Open Agent Spec projects"
  homepage "https://www.openagentstack.ai"
  url "https://files.pythonhosted.org/packages/6b/65/e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855/open_agent_spec-1.2.4.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
