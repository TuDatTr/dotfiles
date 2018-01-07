# dotfiles ┐【￣～￣】┌
These are my personal dotfiles.
I'm using:
* [Manjaro i3](https://manjaro.org/2017/03/07/manjaro-i3-community-edition-17-0-released/)
* [GNU Emacs](https://www.gnu.org/software/emacs/)

## TODOS:
1. Make a proper pip requirements.txt for elpy and .scripts/i3lock.py
2. Making an own conky, conky_maia-like
3. Adding common keybindings of Emacs, i3 and aliases of zsh
4. Improve the README.md or maybe make a wiki.

## Getting Started

### Prerequisites
* emacs
* git 
* python-pip
* texlive-most 
* firefox - Install whatever you like, but you might need to change it up in the .config/i3/config.
* thunderbird - Install whatever you like, but you might need to change it up in the .config/i3/config.
* termite - Prefered terminal emulator, since urxvt can't handle powerline well.
* powerline-fonts - Powerline fonts for the Powerlevel9k-theme
* awesome-terminal-fonts - Font to display cool icons like: , ,  or . Necessary for powerlevel9k.
* zsh-theme-powerlevel9k - Powerlevel9k-theme for zsh
* evince - pdf viewer, default to view compiled LaTeX-files with auctex(emacs plugin)

* palemoon-bin - Not needed anymore, if you got Firefox.

* i3lock-color - Needed for ~/.scripts/i3lock.py

```
sudo pacman -Syu
sudo pacman -S emacs git termite python-pip zsh-theme-powerlevel9k powerline-fonts awesome-terminal-fonts texlive-most firefox thunderbird evince
sudo pacman -R palemoon-bin
yaourt -S i3lock-color
```

### Setting up zsh as default shell.
```
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  # Downloading/Installing oh-my-zsh
cp -r /usr/share/zsh-theme-powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k  # copying powerlevel9k-theme to the desired directory
rm -rf ~/.*bash* # remove bash-stuff from your home directory.. don't do it if you wanna keep using bash
```

### For Emacs
If you have a clean emacs installation you need to add the following snippet to your ~/.emacs file first.
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
More information on the following packages can be found inside of my .emacs file.
Open emacs and do the following:
(M = <Alt>/<Meta>)
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

### Setups
Setting up some programs.
#### Installing Nextcloud-Client
```
wget https://download.nextcloud.com/desktop/releases/Linux/Nextcloud-2.3.3-x86_64.AppImage --P ~/Downloads/
chmod +x ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage
sudo ln -s ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage /usr/bin/nextcloud
```

#### Finally *"installing"* the dotfiles.
```
git clone https://github.com/TuDatTr/dotfiles
cp -r ./dotfiles/.* ~/.
rm -rf ~/.i3/
sudo ln -s ~/.scripts/pipes.sh /usr/local/bin/pipes
```
If you're using elpy you might want to do this.

```pip install -r --user ~/dotfiles/requirements.txt```

# Author
* Tuan-Dat Tran - [TuDatTr](https://github.com/tudattr/)

# License
This project is license under the GPL-3.0 License - see LICENSE file for details.

# Acknowledgements
* [unixporn - the home for *NIX customization!](https://www.reddit.com/r/unixporn/)