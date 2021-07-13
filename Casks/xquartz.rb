# Adapted from: https://github.com/Homebrew/homebrew-cask/blob/6af8d79ccf805ef7da1a1bb0af3b9718a703a0c5/Casks/xquartz.rb
cask "xquartz" do
  version "2.7.11"
  sha256 "32e50e8f1e21542b847041711039fa78d44febfed466f834a9281c44d75cd6c3"

  # The verbatim upstream formula for this version no longer correctly installs as the releases have been removed from bintray.com.
  # Instead, backport [the GitHub release pattern from the updated version](https://github.com/Homebrew/homebrew-cask/blob/8b75ca4029a7103edaaaa899443063882a41ff77/Casks/xquartz.rb#L5-L6), since the old version were re-released on GitHub.
  url "https://github.com/XQuartz/XQuartz/releases/download/XQuartz-#{version}/XQuartz-#{version}.dmg",
      verified: "github.com/XQuartz/XQuartz/"
  name "XQuartz"
  desc "Open-source version of the X.Org X Window System"
  homepage "https://www.xquartz.org/"

  livecheck do
    url "https://www.xquartz.org/releases/sparkle/release.xml"
    strategy :sparkle do |item|
      item.short_version.delete_prefix("XQuartz-")
    end
  end

  auto_updates true

  pkg "XQuartz.pkg"

  uninstall quit:      "org.macosforge.xquartz.X11",
            launchctl: [
              "org.macosforge.xquartz.startx",
              "org.macosforge.xquartz.privileged_startx",
            ],
            pkgutil:   "org.macosforge.xquartz.pkg",
            delete:    [
              "/opt/X11",
              "/private/etc/manpaths.d/40-XQuartz",
              "/private/etc/paths.d/40-XQuartz",
            ]

  zap trash: [
    "~/.Xauthority",
    "~/Library/Application Support/XQuartz",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.macosforge.xquartz.x11.sfl*",
    "~/Library/Caches/org.macosforge.xquartz.X11",
    "~/Library/Cookies/org.macosforge.xquartz.X11.binarycookies",
    "~/Library/Logs/X11/org.macosforge.xquartz.log",
    "~/Library/Logs/X11/org.macosforge.xquartz.log.old",
    "~/Library/Preferences/org.macosforge.xquartz.X11.plist",
    "~/Library/Saved Application State/org.macosforge.xquartz.X11.savedState",
  ],
      rmdir: [
        "~/.fonts",
        "~/Library/Logs/X11",
      ]
end
