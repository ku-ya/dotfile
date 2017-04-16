# dotfile
## System dependencies and application install
- run ```bash install.sh```
- TODO: complete by adding repository download and execution

system configuration dotfile
- if system copy is not working check: sudo apt-get install vim-gtk

```bash
$ git clone https://github.com/ku-ya/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install
```
## powerline unified theme

[link to ubuntu help](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
[powerline-gitstatus](https://github.com/jaspernbrouwer/powerline-gitstatus)

- after json file updade, run: powerline-daemon --replace
- powerline is used for all ipython, tmux, and neovim.

```
$ pip install powerline-status
$ pip install powerline-gitstatus
```

## Switching cap-lock and esc
- use setxkbmap
- config/xkb/config.keyboard file canbe applied

## tmux.conf
- powerline theme and configuration

## system wise font setting

sudo fc-cache -vf ~/.fonts

## neovim
- config/nvim/init.vim

## .zshrc

## Latex
- Use vimtex + zathura (install zathura and zathura-dev)
- Inverse and forward search works
- [some useful info](https://wikimatze.de/vimtex-the-perfect-tool-for-working-with-tex-and-vim/)
- require xdotool
