class Kux < Formula
  desc "High-performance Kubernetes terminal UI"
  homepage "https://github.com/maxsxu/kux"
  url "https://github.com/maxsxu/kux.git",
      revision: "f1d55986a89d48ba66e1b1d6f31cc783d98ea6f9"
  version "0.1.0"
  license "Apache-2.0"
  revision 9
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
