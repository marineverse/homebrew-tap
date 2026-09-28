class Marineverse < Formula
  desc "Sailing races, boats, and MarineVerse account access from your terminal"
  homepage "https://github.com/marineverse/marineverse-cli"
  url "https://registry.npmjs.org/@marineverse/cli/-/cli-0.1.3.tgz"
  sha256 "b81fa05357bf3c63d8f1277450a45057a4c6756c8bffe4396924fdf67c1c6e7c"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    (bin/"marineverse").write_env_script libexec/"bin/marineverse",
                                       PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    ENV["MARINEVERSE_CONFIG_DIR"] = testpath/"settings"
    assert_match version.to_s, shell_output("#{bin}/marineverse --version")
    assert_match "Usage: marineverse", shell_output("#{bin}/marineverse help")
    command = "#{bin}/marineverse --env production --json globe boats view-3d test-boat --no-browser"
    result = JSON.parse(shell_output(command))
    assert_equal "https://www.marineverse.com/globe/boats-profiles/test-boat/3d", result.fetch("data").fetch("url")
    assert_equal false, result.fetch("data").fetch("browser_opened")
    # Load the native credential binding without reading or writing credentials.
    system formula_opt_bin("node")/"node", "-e",
           "require('#{libexec}/lib/node_modules/@marineverse/cli/node_modules/@napi-rs/keyring')"
  end
end
