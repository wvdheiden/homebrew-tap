class Twinc < Formula
  desc "Two-panel file manager for the terminal in classic DOS commander style"
  homepage "https://github.com/wvdheiden/twinc"
  url "https://github.com/wvdheiden/twinc/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "bec631ad1758279d5ea7d1d9899928a619061713c427e5f8116417fa3bb43ba8"
  license "MIT"
  head "https://github.com/wvdheiden/twinc.git", branch: "main"

  depends_on :macos

  def install
    system "make", "CXX=#{ENV.cxx}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      To start twinc with `ncm` and have your shell follow the last directory
      when you quit, add this to ~/.zshrc:

        source #{opt_pkgshare}/ncm.zsh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twinc --version")
  end
end
