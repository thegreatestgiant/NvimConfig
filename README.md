# NvimConfig

## Install Personal Nvim Config

```sh
git clone https://github.com/thegreatestgiant/NvimConfig ~/.config/nvim && nvim
```

## Crostini NerdFont Install

1. You need to go this [url](chrome-untrusted://terminal/html/nassh_preferences_editor.html) and put the `Text font family` as `'JetBrainsMono Nerd', 'Noto Sans Mono'`
2. You have to put the Custom CSS `(inline text)` as

```CSS
@font-face {
font-family: "JetBrainsMono Nerd";
src: url(https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf);
font-weight: normal;
font-style: normal;
}
```

## Stuff to install on a debian based system prior

```bash
sudo apt install -y gcc unzip rigrep
```
