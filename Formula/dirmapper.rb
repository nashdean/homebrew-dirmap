class Dirmapper < Formula
  desc "A CLI tool to generate a directory structure mapping"
  homepage "https://github.com/nashdean/dirmap"
  url "https://github.com/nashdean/dirmap/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "f41a4e5f8f48bc1d0843286c3821c3d9748a57b7fa50bfd6ef5ce6a4bb6c9bb5"
  license "MIT"

  depends_on "python@3.9"

  def install
    libexec.install "src/dirmapper/main.py"
    chmod 0755, libexec/"main.py"
    (bin/"dirmap").write <<~EOS
      #!/bin/bash
      python3 #{libexec}/main.py ""
    EOS
    chmod 0755, bin/"dirmap"
  end

  test do
    system "#{bin}/dirmap", "--version"
  end
end
