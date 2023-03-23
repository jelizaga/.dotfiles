#!/bin/bash

packages_installed=0
os=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

# print_title ##################################################################
# Prints install+'s title.
print_title () {
  printf "   \"                    m           \"\"#    \"\"#\n"
  printf " mmm    m mm    mmm   mm#mm   mmm     #      #      m\n"
  printf "   #    #\"  #  #   \"    #    \"   #    #      #      #\n"
  printf "   #    #   #   \"\"\"m    #    m\"\"\"#    #      #   \"\"\"#\"\"\"\n"
  printf " mm#mm  #   #  \"mmm\"    \"mm  \"mm\"#    \"mm    \"mm    #\n"
  printf "\n"
}

print_os () {
  printf "$(gum style --bold 'OS:') $os\n"
}

# gum_is_installed
#  `true` - if gum is installed.
#  `false` - if gum has yet to be installed.
gum_is_installed () {
  dpkg -s gum >& /dev/null
  if [ $? == 1 ]; then
    false
  else
    true
  fi
}

# os_is_debian_based
#   `true` - if OS is Debian-based.
#   `false` - if OS is not Debian-based.
os_is_debian_based () {
  if [ "$os" = "Pop!_OS" ] || [ "$os" = "Ubuntu" ] || [ "$os" = "Debian"]; then
    true
  else
    false
  fi
}

# os_is_rhel_based
#   `true` - if OS is RHEL-based.
#   `false` - if OS is not RHEL-based.
os_is_rhel_based () {
  if [ "$os" = "Fedora" ]; then
    true
  else
    false
  fi
}

# gum_check
# Checks if gum is installed; installs gum if it's not installed.
gum_check () {
  if ! gum_is_installed; then
    printf "❌ Gum is not installed."
    install_gum
  fi
}

# Package Installation  ########################################################

# install_gum
# Installs gum.
install_gum () {
  if os_is_debian_based; then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install gum
  fi
}

# install_d2
# Installs d2.
install_d2 () {
  curl -fsSL https://d2lang.com/install.sh | sh -s --
}

# Package Selection ############################################################

print_packages_installed () {
  if [ $packages_installed -gt 1 ]; then
    printf "🏡🚛 $packages_installed packages installed.\n"
  elif [ $packages_installed -eq 1 ]; then
    printf "🏡🚚 One package installed.\n"
  else
    printf "🏡🛻 No packages installed.\n"
  fi
}

menu_package_categories () {
  printf "\n"
  printf "Press $(gum style --bold --foreground '#E60000' 'x') to select \
software categories;\n"
  printf "press $(gum style --bold --foreground '#E60000' \
'enter') to confirm your selection:\n"
  PACKAGE_CATEGORIES=$(jq -r '.categories | map(.category_name)[]' \
    packages.json | gum choose --no-limit)
  echo "$PACKAGE_CATEGORIES"
}

# verify_package_installed #####################################################
# Returns 1 if package is missing; 0 if found.
# Prints message declaring package status.
# Args:
#   $1 - Package id.
#   $2 - Package manager or method used to install package.
verify_package_installed () {
  if [ $2 == apt ]; then
    dpkg -s $1 >& /dev/null
  elif [ $2 == flatpak ]; then
    flatpak info $1 >& /dev/null
  elif [ $2 == snap ]; then
    snap list $1 >& /dev/null
  elif [ $2 == npm ]; then
    npm ls $1 >& /dev/null
  fi
  if [ $? == 1 ]; then
    printf "❌ $1 is missing.\n"
    return 1
  else
    printf "👍 $1 is already installed.\n"
    return 0
  fi
}

# verify_package_available #####################################################
# Returns 0 if package is available for installation; 1 if unavailable.

# install_package ##############################################################
# Installs a package if it's missing.
# Args:
#   $1 - Package id.
#   $2 - Package manager or method to use to install package.
install_package () {
  verify_package_installed $1 $2
  if [ $? == 1 ]; then
    if [ $2 == apt ]; then
      gum spin --spinner globe --title "Installing $1..." -- sudo apt install $1
    elif [ $2 == flatpak ]; then
      gum spin --spinner globe --title "Installing $1..." -- flatpak install -y $1 
    elif [ $2 == snap ]; then
      #gum spin --spinner globe --title "Installing $1..." -- snap install $1
      snap install $1
    elif [ $2 == npm ]; then
      gum spin --spinner globe --title "Installing $1..." npm install $1
      #npm install $1 >& /dev/null
      printf "🎁 $1 installed.\n"
    fi
    if [ $? == 0 ]; then
      printf "🎁 $1 installed.\n"
      packages_installed=$(($packages_installed + 1))
    else
      printf "❗ $1 could not be installed.\n"
    fi
  fi
}

print_title
print_os
gum_check
menu_package_categories
