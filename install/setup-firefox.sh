# Function to find the Firefox Developer Edition profile directory
find_firefox_dev_profile() {
  find ~/.mozilla/ -type d -name "*.dev-edition-default"
}

# Set preferences
set_preferences() {
  local profile_dir=$1
  local user_js="$profile_dir/user.js"
  touch "$user_js"

  cat <<EOL >> "$user_js"
// Disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

// Enable Do Not Track
user_pref("privacy.donottrackheader.enabled", true);

// Disable telemetry
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrping.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);

// Additional sane defaults
// Disable Pocket integration
user_pref("extensions.pocket.enabled", false);

// Block third-party cookies
user_pref("network.cookie.cookieBehavior", 1);

// Disable WebRTC
user_pref("media.peerconnection.enabled", false);

// Enable Tracking Protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

// Enable smooth scrolling
user_pref("general.smoothScroll", true);

// Enable spell check in all text fields
user_pref("layout.spellcheckDefault", 2);

// Open new tabs next to current tab
user_pref("browser.tabs.insertRelatedAfterCurrent", true);

// Increase browser cache size
user_pref("browser.cache.disk.capacity", 1048576);

// Disable animations
user_pref("toolkit.cosmeticAnimations.enabled", false);

// Enable hardware acceleration
user_pref("layers.acceleration.enabled", true);

// Increase content process limit
user_pref("dom.ipc.processCount", 8);

// Disable Firefox studies
user_pref("app.shield.optoutstudies.enabled", false);

// Disable pre-fetching
user_pref("network.prefetch-next", false);

// Ask where to save downloads
user_pref("browser.download.useDownloadDir", false);

// Disable automatic opening of downloaded files
user_pref("browser.download.manager.skipWinSecurityPolicyChecks", false);

// Disable password saving
user_pref("signon.rememberSignons", false);
EOL
}

# Install extension
install_extension() {
  local profile_dir=$1
  local extension_url=$2
  wget -O /tmp/extension.xpi "$extension_url"
  local extensions_dir="$profile_dir/extensions"
  mkdir -p "$extensions_dir"
  cp /tmp/extension.xpi "$extensions_dir"
}

# Download and install the Nord Firefox theme
install_nord_theme() {
  local profile_dir=$1
  local chrome_dir="$profile_dir/chrome"
  mkdir -p "$chrome_dir"
  
  # Download Nord Firefox theme from GitHub
  wget -O /tmp/nord-firefox.zip https://github.com/dragonejt/nord-firefox/archive/refs/heads/master.zip
  unzip /tmp/nord-firefox.zip -d /tmp
  cp -r /tmp/nord-firefox-master/* "$chrome_dir"
  
  # Create or update userChrome.css to apply the theme
  local user_chrome_css="$chrome_dir/userChrome.css"
  if [ ! -f "$user_chrome_css" ]; then
    touch "$user_chrome_css"
  fi
  
  cat <<EOL >> "$user_chrome_css"
/* Import Nord Firefox theme */
@import "nord.css";
EOL
}

# Main script
main() {
  local profile_dir
  profile_dir=$(find_firefox_dev_profile)
  if [ -z "$profile_dir" ]; then
    echo "Firefox Developer Edition profile directory not found!"
    exit 1
  fi

  set_preferences "$profile_dir"

  # Install extensions
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/addon-446900-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/addon-521554-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/kagi-search-for-firefox/addon-608852-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/addon-506646-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/tabliss/addon-1059991-latest.xpi"

  install_nord_theme "$profile_dir"

  echo "Firefox Developer Edition setup complete."
}

main
