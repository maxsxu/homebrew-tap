class Kux < Formula
  desc "High-performance Kubernetes terminal UI"
  homepage "https://github.com/maxsxu/kux"
  url "https://github.com/maxsxu/kux.git",
      revision: "c4a2893e7e1e6af8652164a0ae0ab2128dd1f23f"
  version "0.1.0"
  license "Apache-2.0"
  revision 8
  head "https://github.com/maxsxu/kux.git", branch: "main"

  depends_on "rust" => :build
  depends_on "kubernetes-cli"

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "kux"
  end

  test do
    assert_match "kux ", shell_output("#{bin}/kux --version")
    assert_match "--read-only", shell_output("#{bin}/kux --help")
    assert_match "value must be greater than zero",
                 shell_output("#{bin}/kux --demo --demo-items 0 2>&1", 2)
  end
end
