# Vivid Dotfiles
## My Setup
* WM: Awesome
* Editor: Neovim
* Prompt: Rofi
* Shell: zsh
* Terminal: alacritty

## Install
This installs all packages that are not already installed necessary for this config to work:
```bash
pacman -S --needed - < scripts/packages.txt
```

You will also need to install [ohmyzsh](https://ohmyz.sh/)

Copy the config via stow:
```bash
git submodule init
git submodule update
stow */
```

## Firefox
-> in about:config
set `gfx.font_rendering.fontconfig.max_generic_substitutions` to `127`
-> addons
- Base
    1. Privacy Badger
    2. uBlock Origin
- Additional
    1. Wappalizer
## Branches
 * master -> somewhat stable 
 * dev -> my daily files 

## License
Provided under the [MIT License](./LICENSE.md)
