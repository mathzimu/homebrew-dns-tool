class DnsClientTool < Formula
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
           "-o", "dns-client-tool"
    bin.install "dns-client-tool"
  end

  test do
    system "#{bin}/dns-client-tool", "--help"
  end
end