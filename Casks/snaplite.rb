cask "snaplite" do
  version "0.3.0"
  sha256 "6be1d146acadd4faccde8ce4306d24346300501a5cc2a69ee9512e652f81c423"

  url "https://github.com/quyvu01/homebrew-tap/releases/download/snaplite-v#{version}/SnapLite-#{version}.zip"
  name "SnapLite"
  desc "Lightweight menu bar screenshot tool"
  homepage "https://github.com/quyvu01/homebrew-tap"

  depends_on macos: :sonoma

  # Installed outside /Applications so it stays out of Launchpad.
  # SnapLite is a menu bar app (LSUIElement), so it has no Dock icon either.
  artifact "SnapLite.app", target: "~/Library/Application Support/SnapLite/SnapLite.app"

  uninstall quit: "com.quyvu.snaplite"

  zap trash: "~/Library/Preferences/com.quyvu.snaplite.plist"

  caveats <<~EOS
    SnapLite is installed to ~/Library/Application Support/SnapLite so it
    does not show up in Launchpad. Start it with:
      open "$HOME/Library/Application Support/SnapLite/SnapLite.app"

    The app is not notarized. If macOS blocks the first launch, open
    System Settings -> Privacy & Security and click "Open Anyway".
    Then grant Screen Recording permission when asked.
  EOS
end
