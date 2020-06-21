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

## vim
* Use vimrc in sudo nvim
sudo -E nvim file

* Use process substitution to open command output like a file
vim <(any_command)
vim <(ls -a)

## Grep
* from command result
    * Grep for command result from other command result
        any_command | grep `other_command` | cut -f1

    * Grep for string from command result
        any_command | grep "example search string" | cut -f1


* Grep and only show up to N surrounding characters
    grep -r -E -o ".{0,10}wantedText.{0,10}" *
        -E tells, that you want to use extended regex
        -o tells, that you want to print only the match
        -r grep is looking for result recursively in the folder

* A recursive ag search for firefox on the root, excluding dirs, excluding some file patterns, showing hidden files, showing only the screen width of context, only on a single line, not showing errors
ag -r --context=0 --hidden --silent --ignore-dir="proj" --ignore-dir="programs" --ignore-dir="node_modules" --ignore-dir="Documents" --ignore-dir="Downloads" --ignore="*.css" --ignore="*.scss" --ignore="*.svg" --ignore-dir="mozilla" --ignore-dir="lib" --ignore-dir="bin" --ignore-dir=".cache" firefox / |sed -E "s/(.{$COLUMNS}).*$/\1/"

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


# Config TODOs
* Fix / remove displayLink, atleast at startup
* get some transparent window sexyness
* spotify in polybar
* commands/shortcuts for opening a terminal to the current nvim location like shift+$mod+enter to i3
* startup workspaces, ie. minimal, and one with chrome + spotify
* make a script that turns bt on and connects to headphones
* 
