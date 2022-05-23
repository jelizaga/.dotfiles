# Disables the mpd system service.
# Now mpd will use `~/.mpd/mpd.conf` instead of the system-wide configuration 
# in `/etc/mpd.conf`.
sudo systemctl disable mpd.service
sudo systemctl disable mpd.socket
