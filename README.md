# dotfiles

Configs, scripts, &amp; dotfiles used to customize my Linux machines.

## Contents

<!-- vim-markdown-toc GFM -->

* [🏠 File Structure](#-file-structure)
  * [start](#start)
  * [/dots](#dots)
  * [/scripts](#scripts)

<!-- vim-markdown-toc -->

## 🏠 File Structure

### start

`start` initializes the installation and configuration of my setup.

### /dots

`/dots` contains my configuration files ('dots') for various applications. I use
these to keep customizations and settings consistent across machines.

* `bash_aliases` - Used by
  [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) to alias commands. 
  *Ex:* Use `v` as a shorter alias for `vim`.
* `bashrc` - Configures Bash on-launch, setting variables and behavior whenever
  the Bash terminal is opened.
* `code.conf` - [Visual Studio Code](Visual Studio Code) config file.
* `espanso-base.yml` - Custom shortcuts for [Espanso](https://espanso.org/).
* `git.conf` - [Git](https://en.wikipedia.org/wiki/Git) config file.
* `keyb.yml` - [`keyb`](https://github.com/kencx/keyb) hotkey list.
* `kitty.conf` - [`kitty`](https://sw.kovidgoyal.net/kitty/conf/) config file.
* `mpd.conf` - [`mpd`](https://www.musicpd.org/) config file.
* `ncmpcpp.conf` - [`ncmpcpp`](https://rybczak.net/ncmpcpp/) config file.
* `package.json` - [`instally`](https://github.com/jelizaga/instally)'s packages
  to install.
* `quotes` - Raw `%`-separated quotes file to be used by 
  [`fortune`](https://en.wikipedia.org/wiki/Fortune_(Unix)).
* `quotes.dat` - Database of quotes from `quotes` used by `fortune`.
* `taskrc` - [Taskwarrior](https://taskwarrior.org/) config file.
* `vimrc` - [Vim](https://www.vim.org/) config file.

### /scripts

`/scripts` contains scripts written for machine set-up and maintenance.
