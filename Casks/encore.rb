cask "encore" do
  version "0.4.1"
  sha256 "803abc3ef371a89ff495bb8c204006b5bf10cbee893b1f3415d2552f175ec623"

  url "https://github.com/Kamasoutra/encore/releases/download/v#{version}/Encore-macOS-arm64.zip"
  name "Encore"
  desc "Native clipboard manager"
  homepage "https://github.com/Kamasoutra/encore"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Encore.app"

  zap trash: [
    "~/Library/Application Support/Encore",
    "~/Library/Caches/local.kama.Encore",
    "~/Library/HTTPStorages/local.kama.Encore",
    "~/Library/Preferences/local.kama.Encore.plist",
  ]

  caveats <<~CAVEATS
    Encore is not notarized yet. If macOS blocks the first launch, open
    System Settings → Privacy & Security and choose Open Anyway.
    Allow Encore in Accessibility so Return pastes directly.
  CAVEATS
end
