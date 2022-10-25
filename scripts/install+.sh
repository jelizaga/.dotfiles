#!/bin/bash

packages_installed=0

# print_title ##################################################################
# Prints install+'s title.
print_title () {
  printf "   \"                    m           \"\"#    \"\"#\n"
  printf " mmm    m mm    mmm   mm#mm   mmm     #      #      m\n"
  printf "   #    #\"  #  #   \"    #    \"   #    #      #      #\n"
  printf "   #    #   #   \"\"\"m    #    m\"\"\"#    #      #   \"\"\"#\"\"\"\n"
  printf " mm#mm  #   #  \"mmm\"    \"mm  \"mm\"#    \"mm    \"mm    #\n"
}

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
  printf "\nChoose a category:\n"
  category=$(gum choose {"🖥️ Development","🔑 Security","⚙️ Utilities","📚 Learning","🎨 Creativity","🖼️ Media","🗨️ Communication"})
  if [ "$category" == "🖥️ Development" ]; then
    menu_development
  elif [ "$category" == "🔑 Security" ]; then
    menu_security
  elif [ "$category" == "⚙️ Utilities" ]; then
    menu_utilities
  elif [ "$category" == "📚 Learning" ]; then
    menu_learning
  elif [ "$category" == "🎨 Creativity" ]; then
    menu_creativity
  elif [ "$category" == "🖼️ Media" ]; then
    menu_media
  elif [ "$category" == "🗨️ Communication" ]; then
    menu_communication
  fi
}

menu_development () {
  printf "\n🖥️ Development\n"

}

menu_security () {
  printf "\n🔑 Security\n"
}

menu_utilities () {
  printf "\n⚙️ Utilities\n"
}

menu_learning () {
  printf "\n📚 Learning\n"
}

menu_creativity () {
 printf "\n🎨 Creativity\n"
}

menu_media () {
 printf "\n🖼️ Media\n"
}

menu_communication () {
  printf "\n🗨️ Communication\n"
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

# install_everything ###########################################################
install_everything () {
  install_package git apt
  install_package vim apt
  install_package code apt
  install_package pass apt
  install_package tomb apt
  install_package syncthing apt
  install_package taskwarrior apt
  install_package timewarrior apt
  install_package htop apt
  install_package vlc apt
  install_package gnome-tweaks apt
  install_package gimp apt
  install_package youtube-dl apt
  install_package mpd apt
  install_package mpc apt
  install_package ncmpcpp apt
  install_package cmatrix apt

  install_package org.gnome.gitlab.somas.Apostrophe flatpak
  install_package us.zoom.Zoom flatpak
  install_package com.valvesoftware.Steam flatpak
  install_package net.ankiweb.Anki flatpak

  install_package lsd snap
}

################################################################################

print_title
menu_package_categories
install_everything
print_packages_installed

# Development
#install_package git apt
#install_package vim apt
#install_package code apt

# Development / Web
#install_package create-react-app npm

#install_package net.ankiweb.Anki flatpak
#install_package tiddlywiki npm

# System Monitoring
#install_package htop apt

# File
#install_package neofetch apt

# GNOME
#install_package gnome-tweaks apt

# Media / Audio
#install_package com.spotify.Client flatpak
#install_package ncmpcpp apt
#install_package mpd apt
#install_package mpc apt

# Media / Video
#install_package vlc apt
#install_package mpd apt
#install_package youtube-dl apt

# Media / Gaming
#install_package com.valvesoftware.Steam flatpak

# Creativity / Graphics
#install_package blender apt
#install_package krita apt
#install_package gimp apt
#install_package obs-studio apt

# Entertainment / TUI
#install_package cmatrix apt
