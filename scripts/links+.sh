#!/bin/bash

################################################################################
# links+.sh ####################################################################
################################################################################

links_created=0

# set_link #####################################################################
# Checks if symbolic links are already made or the related files are missing,
# then creates symbolic links if missing.
# Args:
#   $1 - Path to link's desired destination.
#   $2 - Path to link.
set_link () {
  printf "Checking for $2.\n"
  # If there's a link existing at $2 (path to link)...
  if [ -L $2 ] ; then
      printf "  Link found.\n"
    # Check if link arrives at desired destination—if it's good.
    if [ -e $2 ] ; then
      printf "    👍 Good link.\n"
    # Otherwise,
    else
      printf "    Broken link.\n"
      # Delete this broken link,
      rm $2
      printf "    Link deleted.\n"
      # And create a link from $2 to $1.
      ln -s $1 $2
      printf "    🔗 Created link: $2 → $1\n"
      links_created=$((links_created+1))
    fi
  # Else if there's a file (not a link) at $2 (path to link)...
  elif [ -e $2 ] ; then
    printf "  File found.\n"
    # Delete the existing file @ $2 (since it's not a link),
    rm $2
    printf "    File deleted.\n"
    # And create a link from $2 to $1.
    ln -s $1 $2
    printf "    🔗 Created link: $2 → $1\n"
    links_created=$((links_created+1))
  # Else, we can assume there's no file at $2...
  else
    # So create a link from $2 to $1.
    printf "  File not found.\n"
    ln -s $1 $2
    printf "    🔗 Created link: $2 → $1\n"
    links_created=$((links_created+1))
  fi    
}

################################################################################

#printf "Select links:\n"
#gum choose --no-limit {bash,taskwarrior,vim,git,mpd,espanso,ncmpcpp}

# bash
set_link ~/.dotfiles/dots/bashrc ~/.bashrc
set_link ~/.dotfiles/dots/bash_aliases ~/.bash_aliases
# taskwarrior (task)
set_link ~/.dotfiles/dots/taskrc ~/.taskrc
# vim
set_link ~/.dotfiles/dots/vimrc ~/.vimrc
# git
set_link ~/.dotfiles/dots/git.conf ~/.gitconfig
# espanso
set_link ~/.dotfiles/dots/espanso-base.yml ~/.config/espanso/match/base.yml
# mpd
set_link ~/.dotfiles/dots/mpd.conf ~/.mpd/mpd.conf
# ncmpcpp
set_link ~/.dotfiles/dots/ncmpcpp.conf ~/.ncmpcpp/config
# code
set_link ~/.dotfiles/dots/code.conf ~/.config/Code/User/settings.json

printf "🔗 $links_created links created.\n"
