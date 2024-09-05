class Dirmapper < Formula
  desc "A CLI tool to generate a directory structure mapping"
  homepage "https://github.com/nashdean/dirmap"
  url "https://github.com/nashdean/dirmap/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "f41a4e5f8f48bc1d0843286c3821c3d9748a57b7fa50bfd6ef5ce6a4bb6c9bb5"
  license "MIT"

  depends_on "python@3.12"

  def install
    bin.install "src/dirmapper/main.py" => "dirmap"
    system "pip3", "install", "-r", "requirements.txt"
  end

  test do
    system "#{bin}/dirmap", "--version"
  end
end
