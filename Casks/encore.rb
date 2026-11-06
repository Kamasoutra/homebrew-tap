cask "encore" do
  version "0.8.0"
  sha256 "df6d499fdd11374556d62d40a9b3245d96b11617669a7dc2a1a22a9989143e28"

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
