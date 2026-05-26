class DnsTool < Formula
  desc "DNS client command line tool"
  homepage "https://github.com/mathzimu/dns-client-tool"

  url "https://github.com/mathzimu/dns-client-tool/releases/download/v1.0.0/dns-client-tool-1.0.0.tar.gz"

  sha256 "4a3f310b9ed57023a0cccc89f24ea7a2060e823b90b312cf5ff044987846ee5d"

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