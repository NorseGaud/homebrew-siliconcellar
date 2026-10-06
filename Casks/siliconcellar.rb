cask "siliconcellar" do
  version "0.1.5,52"
  sha256 "a7be5d127175f942c8916a5ffd25bd6c63c6bff402d75928832bc95b64de77b9"

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
