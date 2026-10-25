cask "encore" do
  version "0.4.0"
  sha256 "f6d88145eadd3e3077cd922a7d3698b36a8d94eec3084573892325814bc1ad33"

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
