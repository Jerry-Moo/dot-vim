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
1. git clone --depth=1 https://github.com/jerrywu/dot-nvim.git ~/.config/nvim
2. make or open nvim
```

- Note: If your system sets \$XDG_CONFIG_HOME, use that instead of ~/.config in the code above. Nvim follows the XDG base-directories convention.

**_2._** open the nvim ,it will auto install dein and plugins,when the plugins install success,it will install coc extensions.

**_3._** if you see the coc extesions installed success in your vim commandline .Congratulations‼️
