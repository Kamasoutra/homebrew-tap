cask "encore" do
  version "0.5.0"
  sha256 "a0872fa68f3c5fb227382480fe351f3e49e073e878411075408a6db7c65024ef"

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
