################################################################################
# setup-links.sh ###############################################################
################################################################################
# Creates symbolic links between various program's config locations and their
# actual configs located in ~/.dotfiles/dots.
# SYNTAX: ln -s [destination] [point of entry]
# bashrc #######################################################################
ln -s ~/.dotfiles/dots/bashrc ~/.bashrc
# bash_aliases #################################################################
ln -s ~/.dotfiles/dots/bash_aliases ~/.bash_aliases
# mpd ##########################################################################
mkdir ~/.mpd
ln -s ~/.dotfiles/dots/mpd.conf ~/.mpd/mpd.conf
# ncmpcpp ######################################################################
mkdir ~/.ncmpcpp
ln -s ~/.dotfiles/dots/ncmpcpp.conf ~/.ncmpcpp/config
# code #########################################################################
ln -s ~/.dotfiles/dots/code.conf ~/.config/Code/User/settings.json
# espanso ######################################################################
ln -s ~/.dotfiles/dots/espanso-base.yml ~/.config/espanso/match/base.yml
