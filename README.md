# katyalm's Dotfiles

## Dependencies/Assumptions
### Terminal - Alacritty
This config system uses alacritty as your terminal. You can install it here https://alacritty.org/.

### Nerd Font
You will need to install a "nerd font", which supports additional icons and symbols.
The default alacritty.toml in this setup uses Intel One Mono. Another very popular font is Hack Nerd Font.
You can explore and preview different nerd font options here https://www.nerdfonts.com/font-downloads.
For any font (even Intel One Mono), you will have to download it and install it on your machine. (The installation is extremely easy, but it varies per operating system, so just look up how to install the font on whatever system you are running. If you are using a remote machine, you should be installing the font on your *local* machine).

After installing your chosen font, modify your alacritty.toml to use the font family you just installed. You will have to match the name exactly (except for any modifiers, like -Bold/-Regular/-Italic). For example, the Intel One Mono font file is actually IntoneMono Nerd Font Propo". If you installed Hack, you're in luck, I'll give that to you right here. Your font name is "Hack Nerd Font".
Modify the family property of font.normal in alacritty.toml.
```
[font]
size = 14

[font.normal]
family = "IntoneMono Nerd Font Propo"
```
You can also change the font size property if you want.

