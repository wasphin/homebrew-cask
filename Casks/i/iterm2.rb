cask "iterm2" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  on_high_sierra :or_older do
    version "3.3.12"
    sha256 "6811b520699e8331b5d80b5da1e370e0ed467e68bc56906f08ecfa986e318167"

    livecheck do
      skip "Legacy version"
    end
  end
  on_mojave do
    version "3.4.16"
    sha256 "b0941a008ead9f680e9f4937698b9b849acbb4e30ed1f3f100e3616cd6d49c0b"

    livecheck do
      skip "Legacy version"
    end
  end
  on_catalina :or_newer do
    version "3.5.13"
    sha256 "87f8f6ca41a8af5fa9ea38bdea2e51881311e7fac241a2c79d7630bc509a374d"

    livecheck do
      # workaround for
      # - https://github.com/Homebrew/homebrew-cask/pull/104019
      # - https://github.com/gnachman/iterm2-website/issues/82
      # url "https://iterm2.com/appcasts/final_modern.xml"
      url "https://raw.githubusercontent.com/gnachman/iterm2-website/master/source/appcasts/final_modern.xml"
      strategy :sparkle
    end
  end

  url "https://iterm2.com/downloads/stable/iTerm2-#{version.dots_to_underscores}.zip"
  name "iTerm2"
  desc "Terminal emulator as alternative to Apple's Terminal app"
  homepage "https://iterm2.com/"

  auto_updates true
  conflicts_with cask: [
    "iterm2@beta",
    "iterm2@nightly",
  ]
  depends_on macos: ">= :sierra"

  app "iTerm.app"

  zap trash: [
    "~/Library/Application Scripts/com.googlecode.iterm2.iTermFileProvider",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.googlecode.iterm2.itermai.sfl*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.googlecode.iterm2.sfl*",
    "~/Library/Application Support/iTerm",
    "~/Library/Application Support/iTerm2",
    "~/Library/Caches/com.googlecode.iterm2",
    "~/Library/Containers/com.googlecode.iterm2.iTermFileProvider",
    "~/Library/Containers/iTermAI",
    "~/Library/Cookies/com.googlecode.iterm2.binarycookies",
    "~/Library/HTTPStorages/com.googlecode.iterm2",
    "~/Library/HTTPStorages/com.googlecode.iterm2.binarycookies",
    "~/Library/Preferences/com.googlecode.iterm2.plist",
    "~/Library/Preferences/com.googlecode.iterm2.private.plist",
    "~/Library/Saved Application State/com.googlecode.iterm2*.savedState",
    "~/Library/WebKit/com.googlecode.iterm2",
  ]
end
