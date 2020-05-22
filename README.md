# .dotfiles

These are my personal dotfiles.

Main tools I am currently using are:

- urxvt
- byobu
- vim
- i3-gaps
- ranger
- rofi

## Getting started

Todo (along with cleanup)

### Font setup

Since we use a powerline font we need to install the necessary fonts.

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

This project is license under the GPL-3.0 License - see LICENSE file for details.
