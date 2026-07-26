cask "quotabar" do
  version "1.0.1"
  sha256 "6488a68a9905413847dcc7f64745ec120252d83a7d912dfbadc89b761011fde4"

  url "https://github.com/ronit111/quotabar/releases/download/v#{version}/QuotaBar-#{version}.zip"
  name "QuotaBar"
  desc "Menu bar meter and account bank for running multiple Claude Code accounts"
  homepage "https://github.com/ronit111/quotabar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "QuotaBar.app"

  zap trash: [
    "~/Library/Logs/QuotaBar.log",
    "~/Library/Preferences/com.quotabar.QuotaBar.plist",
  ]

  caveats <<~EOS
    QuotaBar is ad-hoc signed, not notarized with an Apple Developer ID. macOS
    Gatekeeper will block it on first launch. To open it the first time:
      * Right-click (or Control-click) QuotaBar.app in /Applications and choose
        Open, then confirm in the dialog, OR
      * open System Settings -> Privacy & Security and click "Open Anyway".
    This is required only once, and is inherent to ad-hoc signing.

    QuotaBar reads your Claude Code login from the macOS Keychain and stores
    banked account records under ~/.claude/accounts (0600). Nothing is sent
    anywhere except api.anthropic.com's usage endpoint.

    The account-bank helper scripts are bundled inside the app at
    QuotaBar.app/Contents/Resources/account-bank. For the optional shell
    integration (auto-pick hook, swap command), see the README:
    https://github.com/ronit111/quotabar#install
  EOS
end
