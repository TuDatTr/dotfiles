# dotfiles  ┐【￣～￣】┌
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

### Setting up zsh as default shell.
```
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -r /usr/share/zsh-theme-powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
rm -rf ~/.*bash* # remove bash-stuff from your home directory.. don't do it if you wanna keep using bash
```

### Install needed packages/uninstall unnecessary ones.
```
sudo pacman -Syu
sudo pacman -S emacs git termite python-pip zsh-theme-powerlevel9k powerline-fonts awesome-terminal-fonts texlive-most firefox thunderbird evince
sudo pacman -R palemoon-bin
yaourt -S i3lock-color
```

### For Emacs
If you have a clear emacs installation you need to add the following snippet to your ~/.emacs file first.
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

If you're using elpy you might want to do this.

```pip install --user ~/dotfiles/requirements.txt```

### Setups
Setting up some programs.
#### Installing Nextcloud-Client
```
wget https://download.nextcloud.com/desktop/releases/Linux/Nextcloud-2.3.3-x86_64.AppImage -o ~/Downloads/
chmod +x ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage
sudo ln -s ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage /usr/bin/nextcloud
```

#### Finally *installing* the dotfiles.
```
git clone https://github.com/TuDatTr/dotfiles
cp -r ./dotfiles .
rm -rf .i3/
sudo ln -s ~/.scripts/pipes.sh /usr/local/bin/pipes
```

# Author
* Tuan-Dat Tran - [TuDatTr](https://github.com/tudattr/)

# License
This project is license under the GPL-3.0 License - see LICENSE file for details.

# Acknowledgements
* [unixporn - the home for *NIX customization!](https://www.reddit.com/r/unixporn/)