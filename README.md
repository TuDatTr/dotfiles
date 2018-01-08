# dotfiles ┐【￣～￣】┌ #
These are my personal dotfiles.
I'm using:
* [Manjaro i3](https://manjaro.org/2017/03/07/manjaro-i3-community-edition-17-0-released/)
* [i3-gaps](https://github.com/Airblader/i3)
* [GNU Emacs](https://www.gnu.org/software/emacs/)
* [Z shell](http://zsh.sourceforge.net)
* [Oh My Zsh](http://ohmyz.sh)
* [GNU stow](https://www.gnu.org/software/stow)

## TODOS: ##
1. Update this README for the migration to GNU stow and emacs prelude
2. Making an own conky, conky_maia-like
..*[conky](https://github.com/brndnmtthws/conky/wiki/Configuraion-Settings)
3. Sorting the "Prerequisites" by importance
4. Improve the README.md or maybe make a wiki.
5. Getting away from Manjaro i3 (?)

## Getting Started ##

### Prerequisites ###

Pacman Install
* [emacs](https://wiki.archlinux.org/index.php/Emacs) - A extensible, cusotmizable, free/libre text editor - and more.
* [git](https://wiki.archlinux.org/index.php/git) - A free and open source distributed version control system.
* [python-pip](https://pip.pypa.io/en/stable) - pip to install python packages (**p**ip **i**nstalls **p**ackages)
* [termite](https://wiki.archlinux.org/index.php/termite) - Prefered terminal emulator, since urxvt can't handle powerline well.
* [powerline-fonts](https://github.com/powerline/fonts) - Powerline fonts for the Powerlevel9k-theme.
* [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts) - Font with cool icons. Necessary for powerlevel9k.
* [zsh-theme-powerlevel9k](https://github.com/bhilburn/powerlevel9k) - Powerlevel9k-theme for zsh.
* [texlive-most](https://wiki.archlinux.org/index.php/TeX_Live) - (optional)A high-quality typesetting system.
* [firefox](https://www.mozilla.org/en-US/firefox) - (optional) Install whatever you like, but you might need to change it up in the .config/i3/config.
* [thunderbid](https://www.mozilla.org/en-US/thunderbird) - (optional) Install whatever you like, but you might need to change it up in the .config/i3/config.
* [veracrypt](https://veracrypt.codeplex.com) - (optional) A free disk encryption software based on TrueCrypt.
* [keepassx2](https://keepass.info) - (optional) A free, open source, light-weight and easy-to-use password manager.
* [evince](https://wiki.archlinux.org/index.php/GNOME/Document_viewer) - (optional, needed if you want to use auctex) pdf viewer, default to view compiled LaTeX-files with auctex(emacs plugin).
* [xorg-backlight](https://wiki.archlinux.org/index.php/backlight)
* [pulseaudio-alsa](https://wiki.archlinux.org/index.php/PulseAudio) - (recommended)
* [pulseaudio-bluetooth](https://wiki.archlinux.org/index.php/PulseAudio) - (recommended)
* [nyancat](http://www.nyan.cat/) - (optional)
* [cmus](https://wiki.archlinux.org/index.php/Cmus) - (optional) cli music player
* [stow](https://www.gnu.org/software/stow/) - To manage dotfiles
* [aspell-en]() - Language for flycheck
* [aspell-de]() -Language for flycheck

Pacman Remove
* [palemoon-bin](https://www.palemoon.org) - Not needed anymore, if you use Firefox.
* [epdfview](https://github.com/jristz/epdfview) - Not needed anymore, if you use evince.

Yaourt Install
* [i3lock-color](https://github.com/PandorasFox/i3lock-color) - Needed for ~/.scripts/i3lock.py
* [cli-visualizer](https://github.com/dpayne/cli-visualizer) - Command line visualizer.

```
sudo pacman -Syu
sudo pacman -S emacs git termite python-pip zsh-theme-powerlevel9k powerline-fonts awesome-terminal-fonts texlive-most firefox thunderbird evince veracrypt keepassx2 xorg-xbacklight pulseaudio-alsa pulseaudio-bluetooth nyancat cmus
sudo pacman -R palemoon-bin epdfview
yaourt -S i3lock-color cli-visualizer
```

### Setting up zsh ###
```
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  # Downloading/Installing oh-my-zsh
cp -r /usr/share/zsh-theme-powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k  # copying powerlevel9k-theme to the desired directory
rm -rf ~/.*bash* # remove bash-stuff from your home directory.. don't do it if you wanna keep using bash
```

### Setting up Emacs ###
If you have a clean emacs installation, you need to add the following snippet to your ~/.emacs file first.
This enables simple package installation.
```
(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   '("elpy" . "http://jorgenschaefer.github.io/packages/")
   )
  )
```

Afterwards you can do this, to get some neat packages.
More information on the following packages can be found inside of my **.emacs** file.
Open emacs and do the following:
(M = \<Alt\>/\<Meta\>)
```
M-x package-install auctex
M-x package-install dummyparens
M-x package-install elpy
M-x package-install flycheck
M-x package-install forest-blue-theme
M-x package-install google-this
M-x package-install nyan-mode
M-x package-install rainbow-mode
```

You can browse some more packages by entering this `M-x package-list-packages` in emacs.

### Setups ###
Setting up some programs.
#### Installing Nextcloud-Client (optional) ####
```
wget https://download.nextcloud.com/desktop/releases/Linux/Nextcloud-2.3.3-x86_64.AppImage --P ~/Downloads/
chmod +x ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage
sudo ln -s ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage /usr/bin/nextcloud
```

#### Finally *"installing"* the dotfiles. ####
```
git clone https://github.com/TuDatTr/dotfiles .dotfiles
stow
rm -rf ~/.i3/
sudo ln -s ~/.scripts/pipes.sh /usr/local/bin/pipes
```
If you're using elpy you might want to do this.

```pip install -r --user ~/dotfiles/requirements.txt```

# Author #
* Tuan-Dat Tran - [TuDatTr](https://github.com/tudattr/)

# License #
This project is license under the GPL-3.0 License - see LICENSE file for details.

# Acknowledgements #
* [unixporn - the home for *NIX customization!](https://www.reddit.com/r/unixporn/)
