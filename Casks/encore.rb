cask "encore" do
  version "0.7.0"
  sha256 "7563cf940ec0152357f776067478221dc78b2f21611ddfd318e43c7306e62587"

  url "https://github.com/Kamasoutra/encore/releases/download/v#{version}/Encore-macOS.zip"
  name "encore"
  desc "Native clipboard manager"
  homepage "https://github.com/Kamasoutra/encore"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Encore.app"

  zap trash: [
    "~/Library/Application Support/Encore",
    "~/Library/Caches/local.kama.Encore",
    "~/Library/HTTPStorages/local.kama.Encore",
    "~/Library/Preferences/local.kama.Encore.plist",
  ]

  caveats <<~CAVEATS
    encore is not notarized yet. If macOS blocks the first launch, open
    System Settings → Privacy & Security and choose Open Anyway.
    Allow encore in Accessibility so Return pastes directly.
  CAVEATS
end
