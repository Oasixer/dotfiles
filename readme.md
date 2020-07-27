# Description
Just my linux dotfiles and other config

* Note: there are instructions for setting up eduroam on linux, see the eduroam subdirectory

# Themes used:
* Polybar: polybar-themes: https://github.com/adi1090x/polybar-themes -> polybar-6, style 5
* termite-style: https://github.com/adi1090x/termite-style/ -> material, font = hack
* also related: to fix cursor in wrong position, fix locale https://wiki.archlinux.org/index.php/Locale

* FONT FUCKERY:
  * perl test-fonts.pl "🌔"
  * perl test-fonts.pl ""

# Useful system commands
## backlight
xbacklight set n 
    # 0 <= n <= 100

## monitors
### installation
* https://wiki.archlinux.org/index.php/DisplayLink#Setting_up_X_Displays
* https://wiki.archlinux.org/index.php/Multihead

### enable triple mon
xrandr --output DVI-I-2-2 --mode 1920x1080 --right-of eDP1 --output DVI-I-1-1 --mode 1920x1080 --right-of DVI-I-2-2

### enable dual monitor, disable laptop
xrandr --output eDP1 --off --output DVI-I-2-2 --mode 1920x1080 --primary --output DVI-I-1-1 --mode 1920x1080 --right-of DVI-I-2-2


## Date & Time
* Issues with dual boot resetting time, see here https://wiki.archlinux.org/index.php/System_time#UTC_in_Windows
  * also https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/
* Keep system clock sync'd via NTP:
    * Add the following to /etc/systemd/timesyncd.conf:

[Time]
NTP=0.north-america.pool.ntp.org 1.north-america.pool.ntp.org 2.north-america.pool.ntp.org 3.north-america.pool.ntp.org
FallbackNTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org

    * then run:
        * systemctl enable systemd-timesyncd.service
        * systemctl start systemd-timesyncd.service

## Enable and disable devices ie. trackpad, touchscreen

* List devices

xinput list

* Get info about a device

xinput list-props <device>

* Disable / enable device

xinput disable <device>

xinput enable <device>

* Devices (laptop)
    * On my specific current laptop, the trackpad is:

⎜↳ Synaptics TM3075-002 id=22	[slave  pointer  (2)]

    * The touch screen is

Wacom Pen and multitouch sensor Finger touch	id=15

# Get keycodes for X server from cmdline keypresses
xev

