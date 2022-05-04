# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cloudsmith < Formula
  include Language::Python::Virtualenv

  desc "Cloudsmith Command Line Interface (CLI)"
  homepage "https://help.cloudsmith.io/docs/cli/"
  url "https://github.com/cloudsmith-io/cloudsmith-cli/archive/refs/tags/v0.32.0.tar.gz"
  version "0.32.0"
  sha256 "18b1702f26fb6399366c64fa76a676651fcc1acb27981ad689ba6193e9db452a"
  license "Apache-2.0"

  depends_on "python"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    virtualenv_install_with_resources
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cloudsmith-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
