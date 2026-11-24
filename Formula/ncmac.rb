class Ncmac < Formula
  desc "Two-panel file manager for the terminal in classic DOS commander style"
  homepage "https://github.com/wvdheiden/ncmac"
  url "https://github.com/wvdheiden/ncmac/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256_OF_THE_TAG_TARBALL"
  license "MIT"
  head "https://github.com/wvdheiden/ncmac.git", branch: "main"

  depends_on :macos

  def install
    system "make", "CXX=#{ENV.cxx}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      To start ncmac with `ncm` and have your shell follow the last directory
      when you quit, add this to ~/.zshrc:

        source #{opt_pkgshare}/ncm.zsh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ncmac --version")
  end
end
