class Kux < Formula
  desc "High-performance Kubernetes terminal UI"
  homepage "https://github.com/maxsxu/kux"
  url "https://github.com/maxsxu/kux.git",
      revision: "aa18270857a3f60054e8bb3d89fb8696af7957ee"
  version "0.1.0"
  license "Apache-2.0"
  revision 5
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
