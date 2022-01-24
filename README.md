# .dotfiles

These are my personal dotfiles.

Main tools I am currently using are:

- zsh
- gvim
- byobu
- conky
- firefox
- rxvt-unicode
- dunst
- highlight
- i3-gaps
- neofetch
- ranger
- rofi
- emacs
- polybar
- termite

## Getting started

To make full use of the dotfiles we need to install the following packages via pacman:

`pacman -Syu zsh gvim byobu conky firefox rxvt-unicode dunst highlight i3-gaps neofetch ranger rofi emacs`

And the following packages from the AUR:
`yay -S polybar termite`

### zsh setup

```sh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -r /usr/share/zsh-theme-powerlevel9k $HOME/.oh-my-zsh/themes/powerlevel9k
rm -rf $HOME/.*bash* # optional, but removes all bash related stuff from the home directory
```

### Font setup

Since we're using a powerline font we need to install them first.

```sh
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts/
```

### Installing the dotfiles

To deploy the .dotfiles we use the tool stow.

```sh
git clone https://github.com/TuDatTr/dotfiles .dotfiles && cd .dotfiles
stow vim
stow zsh
stow config
```

## Author

- Tuan-Dat Tran - [TuDatTr](https://github.com/TuDatTr/)

## License

This project is licensed under the GPL-3.0 License - see LICENSE file for details.
