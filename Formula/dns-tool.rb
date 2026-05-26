class DnsTool < Formula
  desc "DNS client command line tool"
  homepage "https://github.com/mathzimu/dns-client-tool"

  url "https://github.com/mathzimu/dns-client-tool/archive/refs/tags/v1.0.0.tar.gz"

  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
           "-ldflags=-s -w",
           "-trimpath",
           "-o", "dns-tool"
    bin.install "dns-tool"
  end

  test do
    system "#{bin}/dns-tool", "--help"
  end
end