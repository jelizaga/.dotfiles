###############################################################################
# PACKAGE MANAGER: apt ########################################################
###############################################################################
sudo apt update
sudo apt install -y \
# DEVELOPMENT #################################################################
# vim - Text editor.
vim \
# git - Version control.
git \
# Visual Studio Code - IDE.
code \
# Syncthing - For synchronizing files across machines.
syncthing \
# pass - For securing passwords.
pass \
# tomb - For securing data.
tomb \
# PRODUCTIVITY ################################################################
# taskwarrior
taskwarrior \
# timewarrior
timewarrior \
# QUALITY OF LIFE #############################################################
# neofetch - For neat-o print-outs of my desktop environment.
neofetch \
# gnome-tweaks - For customizing GNOME.
gnome-tweaks \
# nnn - For file management from the terminal.
nnn \
# htop - For system monitoring and looking Hackers (1995) af.
htop \
# cmatrix - For fun.
cmatrix \
# MEDIA CONSUMPTION ###########################################################
# VLC - For watching videos.
vlc \
# youtube-dl - For downloading videos for editing and archivism.
youtube-dl \
# mpd - For music serving.
mpd \
# mpc - Command line UI for mpd.
mpc \
# ncmpcpp - For music enjoyment.
ncmpcpp \
# ART CREATION ################################################################
# Blender - 3D art.
blender \
# Krita - 2D art.
krita \
# GIMP - Photo editing and hex code-obtaining when I'm deprived of Photoshop.
gimp \
# OBS Studio - For recording desktop video and streaming.
obs-studio \
bastet \
nsnake \
2048

###############################################################################
# PACKAGE MANAGER: flatpak ####################################################
###############################################################################
flatpak install \
# MEDIA APPRECIATION ##########################################################
# Spotify - For streaming & discovering music.
com.spotify.Client \
# Steam - For video games.
com.valvesoftware.Steam \
# STUDYING ####################################################################
# Anki - For spaced repetition studying.
net.ankiweb.Anki

###############################################################################
# PACKAGE MANAGER: snap #######################################################
###############################################################################
# Espanso - For text expansion.
snap install --classic espanso

###############################################################################
# curl / wget #################################################################
###############################################################################
# DEVELOPMENT #################################################################
# node, npm, fnm - For node-based web development.
curl -fsSL https://fnm.vercel.app/install | bash
fnm install v16.15.0
fnm use v16.15.0
# ART CREATION ################################################################
wget https://warmplace.ru/soft/sunvox/sunvox-2.0e.zip
unzip sunvox-2.0e.zip ~/sunvox

###############################################################################
# PACKAGE MANAGER: npm ########################################################
###############################################################################
npm install -g \
# DEVELOPMENT #################################################################
# create-react-app - For creating React apps.
create-react-app \
# STUDYING ####################################################################
# TiddlyWiki - For note-taking.
tiddlywiki
