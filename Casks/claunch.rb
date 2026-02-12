cask "claunch" do
  version "0.1.0"
  sha256 "6dbe9471470db025a504f3c04261bf6fc5a2a4617974ac48f2ec91a2a8aba9cf"

  url "https://github.com/skeetmtp/claunch/releases/download/v#{version}/Claunch.zip"
  name "Claunch"
  desc "URL scheme handler for Claude Code CLI"
  homepage "https://github.com/skeetmtp/claunch"

  depends_on macos: ">= :monterey"

  app "Claunch.app", target: "#{ENV["HOME"]}/Applications/Claunch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{ENV["HOME"]}/Applications/Claunch.app"]
    system_command "/System/Library/Frameworks/CoreServices.framework" \
                   "/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-R", "#{ENV["HOME"]}/Applications/Claunch.app"]
  end

  uninstall trash: "#{ENV["HOME"]}/Applications/Claunch.app"

  zap trash: "~/.config/claunch"
end
