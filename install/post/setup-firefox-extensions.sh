# Function to find the Firefox Developer Edition profile directory
find_firefox_dev_profile() {
  find ~/.mozilla/ -type d -name "*.dev-edition-default"
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

# Main script for installing extensions and theme
main() {
  local profile_dir
  profile_dir=$(find_firefox_dev_profile)
  if [ -z "$profile_dir" ]; then
    echo "Firefox Developer Edition profile directory not found!"
    exit 1
  fi

  # Install extensions
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/addon-446900-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/addon-521554-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/kagi-search-for-firefox/addon-608852-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/addon-506646-latest.xpi"
  install_extension "$profile_dir" "https://addons.mozilla.org/firefox/downloads/latest/tabliss/addon-1059991-latest.xpi"

  install_nord_theme "$profile_dir"

  echo "Firefox Developer Edition extensions and theme installed."
}

main
