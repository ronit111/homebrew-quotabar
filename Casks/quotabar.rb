cask "quotabar" do
  version "1.0.0"
  sha256 "80a74727655ea9e00712d90c298955963315783e7b268a3504b4387e503b6a78"

  url "https://github.com/ronit111/quotabar/releases/download/v#{version}/QuotaBar-#{version}.zip"
  name "QuotaBar"
  desc "Menu bar tracker for AI usage limits and multi-account switching"
  homepage "https://github.com/ronit111/quotabar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QuotaBar.app"

  zap trash: [
    "~/Library/Logs/QuotaBar.log",
    "~/Library/Preferences/com.quotabar.QuotaBar.plist",
  ]

  caveats <<~EOS
    QuotaBar is ad-hoc signed, not notarized with an Apple Developer ID. macOS Gatekeeper
    will block it on first launch. To open it the first time:
      * Right-click (or Control-click) QuotaBar.app in /Applications and choose Open,
        then confirm in the dialog, OR
      * open System Settings -> Privacy & Security and click "Open Anyway".
    This is required only once, and is inherent to ad-hoc signing.
  EOS
end
