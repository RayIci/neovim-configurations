# NeoVim Configurations

In this repository you will find my custom neovim configurations and plugins.

## Useful links

Useful starting guide on neovim setup [HERE](https://www.youtube.com/watch?v=zHTeCSVAFNY&t=120s).

A more sophisticated guide can be found [HERE](https://www.youtube.com/watch?v=KYDG3AHgYEs).
You can also see the [GITHUB LINK](https://github.com/hendrikmi/neovim-kickstart-config/tree/main).

Kickstart github link [HERE](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua).

Another youtube video [HERE](https://www.youtube.com/watch?v=G7-qUMKSH_Y).

Another youtube video [HERE](https://www.youtube.com/watch?v=6pAG3BHurdM).

## Setting things up

This is done for ubuntu but can be done for every distro of your choice, just use the right package manager.

Update

```bash
sudo apt update
sudo apt upgrade
```

Install libfuse2:

```bash
sudo apt install libfuse2
```

Install `fd` see [github page](https://github.com/sharkdp/fd):
```bash
sudo apt install fd-find
```

Install `luarocks`:

```bash
sudo apt install luarocks
```

Install `ripgrep` see [github page](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation):

```bash
sudo apt install ripgrep
```

Install `nodejs` and `npm`:

```bash
sudo apt install nodejs npm
```

Install `tree-sitter-cli` and `neovim` packages with `npm`:

```bash
sudo npm -g install tree-sitter-cli
sudo npm -g neovim
```

Install python:

```bash
sudo apt install python3 python3-pip python3-venv
```

Install `dotnet` see [installation page](https://learn.microsoft.com/en-us/dotnet/core/install/linux) for new sdk:

```bash
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
```

Install `lazygit` see [github page](https://github.com/jesseduffield/lazygit?tab=readme-ov-file) for your os installtion:

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```
