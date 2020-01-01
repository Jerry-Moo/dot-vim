# Neo/vim8.2 Config

## Feature

- 🚀Fastest StartupTime(Plugins Total:62 40-60ms)
- 💎Modular Plugin Config
- ⚒ Easy to use Easy to hack
- 🌟95% plugins lazyload with dein
- ⚡️Centerd on Coc.nvim, Denite auxiliary
- 🎱Autocompletion by lsp which coc.nvim support
- ⚔️ Fully customizable
- 🌈Comfortable theme gruvbox9

## Required Env

- macos or linux
- neovim >= 0.4.0（cause i used floatwindow,this feature support by neovim 0.4.0 above)
- python3 support
  - pip3 install --user pynvim
- node and yarn
- NerdFont

### Required Tool

- rg (Ripgrep): [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- Universal ctags: [ctags.io](https://ctags.io/)
  - mac `brew install --HEAD universal-ctags/universal-ctags/universal-ctags`
  - ubuntu
    ```
    # install libjansson first
    sudo apt-get install libjansson-dev
    # then compile and install ctags
    ```
- bat : [install bat](https://github.com/sharkdp/bat)

## Installation

**_1._**

```
1. git clone --depth=1 https://github.com/wuchujiecode/dot-nvim.git ~/.config/nvim
2. ./venv.sh
3. make or open nvim
```

- Note: If your system sets \$XDG_CONFIG_HOME, use that instead of ~/.config in the code above. Nvim follows the XDG base-directories convention.

**_2._** open the nvim ,it will auto install dein and plugins,when the plugins install success,it will install coc extensions.

**_3._** if you see the coc extesions installed success in your vim commandline .Congratulations‼️

