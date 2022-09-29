#!/bin/bash

links_created=0

# set_link #####################################################################
# Checks if symbolic links are already made or the related files are missing,
# then creates symbolic links if missing.
# Args:
#   $1 - Path to link's intended destination.
#   $2 - Path to link.
set_link () {
  printf "Checking for $2.\n"
  if [ -L $2 ] ; then
      printf "  Link found.\n"
    if [ -e $2 ] ; then
      printf "  👍 Good link.\n"
    else
      printf "  Broken link.\n"
      rm $2
      printf "  Link deleted.\n"
      ln -s $1 $2
      printf "  🔗 Created link: $2 → $1\n"
      links_created=$((links_created+1))
    fi
  elif [ -e $2 ] ; then
    printf "  File found.\n"
    rm $2
    printf "  File deleted.\n"
    ln -s $1 $2
    printf "  🔗 Created link: $2 → $1\n"
    links_created=$((links_created+1))
  else
    printf "  File not found.\n"
    ln -s $1 $2
    printf "  🔗 Created link: $2 → $1\n"
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
