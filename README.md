## katyalm's Dotfiles

### Dependencies: Terminal and Font

#### Alacritty

This config system uses alacritty as your terminal. You can install it here https://alacritty.org/.
Note: If you already use alacritty, make sure it is updated to the latest version, because the alacritty.toml uses the latest guidelines and conventions. If you see any warnings about `[general] not supported for live_reload_config`, you probably need to update your alacritty.

#### Nerd Font

You will need to install a "nerd font", which supports additional icons and symbols.
The default alacritty.toml in this setup uses Intel One Mono. Another very popular font is Hack Nerd Font.
You can explore and preview different nerd font options here https://www.nerdfonts.com/font-downloads.
For any font (even Intel One Mono), you will have to download it and install it on your machine. (The installation is extremely easy, but it varies per operating system, so just look up how to install the font on whatever system you are running. If you are using a remote machine, you should be installing the font on your **local** machine).

After installing your chosen font, modify your alacritty.toml to use the font family you just installed. You will have to match the name exactly (except for any modifiers, like -Bold/-Regular/-Italic). For example, the Intel One Mono font file is actually IntoneMono Nerd Font Propo". If you installed Hack, you're in luck, I'll give that to you right here. Your font name is "Hack Nerd Font".
Modify the family property of font.normal in alacritty.toml.
```
[font]
size = 14

[font.normal]
family = "IntoneMono Nerd Font Propo"
```
You can also change the font size property if you want.

### Dependencies: Shell, Prompt, and fzf

Note for Windows: This setup assumes that for Windows systems, you are using WSL (Windows Subsystem for Linux). For any OS-specific sections, just follow the Linux instructions on WSL. 

#### zsh
This config uses zsh shell for now. Now, you can use your brand new alacritty terminal to start installing the rest of the dependencies.
Install zsh for your operating system.
<details>
  <summary>macOS</summary>
  <br>
  
  ```
  brew install zsh
  ```
  Set it as your default shell.
  ```
  chsh -s $(which zsh)
  ```
</details>

<details>
  <summary>Linux</summary>
  <br>
  
  ```
  apt install zsh
  ```
  Set it as your default shell.
  ```
  chsh -s $(which zsh)
  ```
</details>

#### Starship

Starship is your prompt customization tool. Your prompt is the command line in the terminal/shell where you type your commands. Starship allows you to display a lot of extra information in your prompt, and improve the aesthetics of how it is displayed. This starship is my personal opinion of a good balance of useful/good looking options for the prompt. To learn more about the current config, you can read the starship.toml. To learn more about all of what starship is capable of, go to https://starship.rs/. Their documentation is really fantastic.

Now, install Starship. Installing is the same on macOS and Linux (and therefore Windows/WSL).
```
curl -sS https://starship.rs/install.sh | sh
```
The zsh config from this setup already enables Starship in your shell, so you don't have to do that part of the setup yourself. But just in case you are curious, all you have to do is add this eval line to the end of your .zshrc.
```
eval "$(starship init zsh)"
```
Again, you **SHOULD NOT** have to do this step yourself, this line already exists in the .zshrc file in this repo.

#### fzf

fzf is a fuzzy-finder for command line tools. I find this most useful for searching through my command history (`Ctrl+R`). It allows me to search for just pieces of a command that I remember, and find every version of the command where that substring was part of it. Git repo for this is here https://github.com/junegunn/fzf.

Install fzf. If you are using Homebrew on Linux, just follow the macOS brew command. If you are using a Linux package manager that is not `apt`, you can find the right command for you in the fzf repo.
<details>
  <summary>macOS (Homebrew)</summary>
  <br>

  ```
  brew install fzf
  ```
</details>

<details>
  <summary>Linux (apt)</summary>
  <br>

  ```
  sudo apt install fzf
  ```
</details>

Similar to Starship above, the .zshrc is already configured to source/setup fzf correctly for your shell, all you have to do is install it.

### Enable your config

Now that your dependencies/prerequisites have been installed, you can activate the dotfiles in this config and begin enjoying your new setup.

#### 1. Clone this repo

At this point, you should clone this repository, wherever you want to keep it. The way this setup works is by symlinking your **own** "dot files" (.zshrc, alacritty.toml, starship.toml, etc.) to the corresponding dotfiles in this repository. So, (assuming your `~` home directory is your base), the link will be `~/.zshrc -> dotfiles/zsh/.zshrc`.
So, clone this repo in a way that makes you happy with the symlinks. I just clone it into my home directory, so it exists as `~/dotfiles/...`.

#### 2. Set up the symlinks

You may need to create some of the directories and/or files in these symlink commands in order to actually link them to the ones in this dotfiles repo.

First, check for the existence of the `~/.config` folder.
