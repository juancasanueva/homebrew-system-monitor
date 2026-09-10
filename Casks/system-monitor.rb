cask "system-monitor" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/juancasanueva/SWIFTUI_system_monitor/releases/download/v#{version}/System-Monitor-#{version}.zip"
  name "System-Monitor"
  name "System Monitor"
  desc "Menu bar monitor for CPU, memory, disk and network"
  homepage "https://github.com/juancasanueva/SWIFTUI_system_monitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "System-Monitor.app"

  zap trash: [
    "~/Library/Application Support/com.juancasanueva.system-monitor",
    "~/Library/Containers/com.juancasanueva.system-monitor",
    "~/Library/Caches/com.juancasanueva.system-monitor",
    "~/Library/HTTPStorages/com.juancasanueva.system-monitor",
    "~/Library/Preferences/com.juancasanueva.system-monitor.plist",
  ]
end
