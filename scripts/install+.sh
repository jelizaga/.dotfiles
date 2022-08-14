#!/bin/bash

# check_if_package_installed ###################################################
# Returns 1 if package is missing; 0 if found.
# Prints message declaring package status.
# Args:
#   $1 - Package id.
#   $2 - Package manager or method used to install package.
check_if_package_installed () {
  if [ $2 == apt ]; then
    dpkg -s $1 >& /dev/null
  elif [ $2 == flatpak ]; then
    flatpak update $1 >& /dev/null
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

# install_package ##############################################################
# Installs a package if it's missing.
# Args:
#   $1 - Package id.
#   $2 - Package manager or method to use to install package.
install_package () {
  check_if_package_installed $1 $2
  if [ $? == 1 ]; then
    if [ $2 == apt ]; then
      gum spin --spinner dot --title "Installing $1..." sudo apt install $1
      printf "🎁 $1 installed.\n"
    elif [ $2 == flatpak ]; then
      # gum spin --spinner dot --title "Installing $1..." flatpak install -y $1
      flatpak install -y $1 >& /dev/null
      printf "🎁 $1 installed.\n"
    elif [ $2 == snap ]; then
      # gum spin --spinner dot --title "Installing $1..." sudo snap install $1
      sudo snap install $1 >& /dev/null
      printf "🎁 $1 installed.\n"
    elif [ $2 == npm ]; then
      gum spin --spinner dot --title "Installing $1..." npm install $1
      #npm install $1 >& /dev/null
      printf "🎁 $1 installed.\n"
    fi
  fi
}

################################################################################

# Development
install_package git apt
install_package vim apt
install_package code apt

# Development / Web
install_package create-react-app npm

# Security
install_package pass apt
install_package tomb apt

# Productivity
install_package syncthing apt
install_package task apt
install_package timew apt
install_package espanso snap

# Knowledge
install_package net.ankiweb.Anki flatpak
install_package tiddlywiki npm

# System Monitoring
install_package htop apt

# File
install_package neofetch apt

# GNOME
install_package gnome-tweaks apt

# Media / Audio
install_package com.spotify.Client flatpak
install_package ncmpcpp apt
install_package mpd apt
install_package mpc apt

# Media / Video
install_package vlc apt
install_package mpd apt
install_package youtube-dl apt

# Media / Gaming
install_package com.valvesoftware.Steam flatpak

# Creativity / Graphics
install_package blender apt
install_package krita apt
install_package gimp apt
install_package obs-studio apt

# Entertainment / TUI
install_package cmatrix apt
