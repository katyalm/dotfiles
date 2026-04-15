### Necessary Functional Features (necessary to function/understand how to use the config)
- [x] dependencies has to include
    - [x] installing zsh
    - [x] installing starship
    - [x] installing fzf

- [ ] instructions about how to actually set up the symlinks

- [ ] .zshrc should have "auto-start tmux" section commented out by default
- [ ] information about where the zsh plugins default path is, and how you can modify it if you want
- [ ] note about how if you use vscode, you should change your default shell to zsh so that you will use this config there too
- [x] note to update alacritty if you already have it installed, as the toml uses latest guidelines and conventions

### 2.0 Features (features that are improvements to the core functionality, but not necessary to get started with this setup)
- [ ] a "simple" alias that switches the symlink to a starship\_bare.toml, which takes all of the symbols and icons out of the prompt for cleaner copying across multiple prompt lines
- [ ] change windows alacritty/zsh combo to somehow allow exiting wsl into base windows terminal (not actually necessary, can always open windows terminal to do whatever probably minimal work is required in base terminal)

### Stretch Features (Fun to have, extra, stretch goals in terms of implementation)
- [ ] a toml (or other config-style) file for the zsh config, that allows easier toggling/selection of various features (such as auto-start in tmux or not)
    - can open and edit the options, like set auto-start-in-tmux = true
    - then, run a script that will re-generate an entire new .zshrc, using predefined modular chunks that it includes based on which flags are set
    - we can set up the [USER ALIASES] section as the only safe/resilient place to put your custom aliases, otherwise they will likely be overwritten by the script
- [ ] script that will do setup for you, so it will auto install zsh, starship, and fzf, and also auto symlink everything (based on your home directory)


