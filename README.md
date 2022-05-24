# dotfiles
Configs, scripts, &amp; dotfiles used to customize my Linux machines.

## Contents

### /dots
* `.bash_aliases` - Alias commands for small improvements to efficiency.
* `mpd.conf` - 
* `ncmpcpp.conf` - 

### /scripts
* `install.sh` - Installs all software desired. *Tested for Pop_OS!.*
* `setup-links.sh` - Sets up symbolic links to dotfiles (under `/dots`).

## Making your own dotfiles (like this)

### Pt. 1 - Set up your dotfile repo

1. **Fork this repo** or **create your own empty dotfiles repo.**
2. **Clone** your dotfiles repo to your machine. You can clone it into your home directory (as `~/dotfiles` (which might look a little fugly relative to the other directories in `~`) or `~/.dotfiles` (if you want it hidden)) or wherever else. Personally, I put my dotfiles in a directory called `~/Development`, where I put all my development stuff. *Where you locate your dotfiles will matter.*

### Pt. 2 - Write an install script

You can find my install script for reference in `/scripts/install.sh`.

3. ✍️ **Determine all the software you want your script to install.** You can make a list in a text document or on paper. Try to be very thorough.
4. 🤨 **Determine the commmands for installing each piece of software.** Use your package managers to search for the correct software names.

**apt:** For example, if I don't know what the "real" name of Tweaks is, I can use `apt search gnome tweaks` and `apt` will return a list of relevant software available in the repos like so:

![Using apt to search for Tweaks.](https://i.imgur.com/y3wVBDI.png)

Now we know that the command to install Tweaks is `sudo apt install gnome-tweaks`!

**flatpak:** You may want to install software available through `flatpak`, like Spotify. To figure out the "real" names of these flatpaks, you can use `flatpak list` to list the flatpaks you currently have installed or `flatpak search [SEARCH TERMS]`. 

![Using flatpak list to view already-installed flatpaks.](https://i.imgur.com/mQDyExL.png)

The *Application ID* is the name you'll need to install a flatpak. Now we know the command to install Spotify is `sudo flatpak install com.spotify.Client`.

**other:** If you're not pulling software from a package manager like `apt`, `npm`, `flatpak`, `anaconda`, etc., you'll just need to write the commands to automate its download and installation. For example, to install `sunvox`, we'd need these commands:

```
# Use wget to download sunvox from the URL serving its zip:
wget https://warmplace.ru/soft/sunvox/sunvox-2.0e.zip
# Unzip the zip at ~/sunvox, assuming that's where you want it unzipped.
unzip sunvox-2.0e.zip ~/sunvox
```

Or for `fnm`:

```
# Use curl to download fnm's install script and pipe it into bash.
curl -fsSL https://fnm.vercel.app/install | bash
# Now that fnm's been installed, you can optionally use it to configure node.
fnm install v16.15.0
fnm use v16.15.0
```

5. 📜 **Write your install script.** Now that you have every command you need to install your software, write an executable file in your favorite shell script. It should (flawlessly) install everything in one go. The reference in this repo is `/scripts/install.sh`.