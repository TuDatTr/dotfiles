# dotfiles
These are my personal dotfiles.

# Using Manjaro i3
```
chsh -s /bin/zsh
rm -rf ~/.*bash*
sudo pacman -Syu
sudo pacman -S emacs git termite python-pip zsh-theme-powerlevel9k powerline-fonts awesome-terminal-fonts
sudo pacman -R palemoon-bin
sudo pacman -S texlive-most firefox
yaourt -S i3lock-color
wget https://download.nextcloud.com/desktop/releases/Linux/Nextcloud-2.3.3-x86_64.AppImage -o ~/Downloads/
chmod +x ~Downloads/Nextcloud-2.3.3-x86_64.AppImage
pip install --user ~/dotfiles/requirements.txt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -r /usr/share/zsh-theme-powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
git clone https://github.com/TuDatTr/dotfiles
cp -r ./dotfiles .
rm -rf .i3/
sudo ln -s ~/.scripts/pipes.sh /usr/local/bin/pipes
sudo ln -s ~/Downloads/Nextcloud-2.3.3-x86_64.AppImage /usr/bin/nextcloud
```

# In Emacs
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