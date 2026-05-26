class DnsTool < Formula
  desc "DNS client command line tool"
  homepage "https://github.com/mathzimu/dns-client-tool"

  url "https://github.com/mathzimu/dns-client-tool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7362d79980cfba2d631f6ca7c093b028d35f67c1f1b8e17d8c8dffb7fb831bce"

  license "MIT"

  depends_on "maven" => :build
  depends_on "openjdk"

  def install
    system "mvn", "package", "-DskipTests"

    libexec.install "client/target/dns-client.jar"
    libexec.install "server/target/dns-server.jar"

    (bin/"dns-client").write <<~SHELL
      #!/bin/bash
      exec "#{Formula["openjdk"].opt_bin}/java" -jar "#{libexec}/dns-client.jar" "$@"
    SHELL

    (bin/"dns-server").write <<~SHELL
      #!/bin/bash
      exec "#{Formula["openjdk"].opt_bin}/java" -jar "#{libexec}/dns-server.jar" "$@"
    SHELL
  end

  test do
    assert_match "usage", shell_output("#{bin}/dns-client --help 2>&1", 1)
  end
end