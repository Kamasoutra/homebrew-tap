cask "encore" do
  version "0.4.2"
  sha256 "39039c6c8d178c024ea3aa1fdc356cdfe695eb3db8776a1ad65ef40a50baf07e"

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
