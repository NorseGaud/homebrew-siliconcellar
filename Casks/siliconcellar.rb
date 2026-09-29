cask "siliconcellar" do
  version "0.1.0,21"
  sha256 "687e1eb37d5cf3c2daea19b6f7ed44ac1556c982fa1b9313fea0192595f3d22b"

  url "https://github.com/NorseGaud/SiliconCellar/releases/download/#{version.csv.first}/SiliconCellar-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Silicon Cellar"
  desc "Run Windows Steam games on Apple Silicon with bundled Wine"
  homepage "https://github.com/NorseGaud/SiliconCellar"

  livecheck do
    url :url
    regex(/^SiliconCellar[._-]v?(\d+(?:\.\d+)+)[._-](\d+)\.dmg$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SiliconCellar.app"

  zap trash: [
    "~/Library/Application Support/SiliconCellar",
    "~/Library/Preferences/com.norsegaud.siliconcellar.plist",
    "~/Library/Saved Application State/com.norsegaud.siliconcellar.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
