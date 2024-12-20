# NeoVim Configurations

In this repository you can find my custom neovim configurations and plugins.
Feel free to use them as you want and give feedback and suggestions.

## Useful links

In this section you can find useful youtube videos or link with awesome configurations and examples:

- Youtube video: [From 0 to IDE in NEOVIM from scratch](https://www.youtube.com/watch?v=zHTeCSVAFNY&t=120s).
- Youtube video: [Full Neovim Setup from Scratch in 2024](https://www.youtube.com/watch?v=KYDG3AHgYEs). Related GitHub link: [neovim-kickstart-config](https://github.com/hendrikmi/neovim-kickstart-config/tree/main).
- Youtube video: [Neovim Setup for Web Dev (JavaScript, Next.js)](https://www.youtube.com/watch?v=G7-qUMKSH_Y).
- Youtube video: [How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide](https://www.youtube.com/watch?v=6pAG3BHurdM).
- Github guide: [Kickstart Configurations](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua).

## Setting things up

Below you can find a list of things that are needed in order to correctly run neovim with it's plugins.
The installation process listed below is done for ubuntu, but it can be done for every distro of your choice, just use the right package manager or installation process.

Update

```bash
sudo apt update
sudo apt upgrade
```

Install libfuse2:

```bash
sudo apt install libfuse2
```

Install `xclip`:

```bash
sudo apt install xclip
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

Install `yarn` see [github page](https://classic.yarnpkg.com/en/docs/install#windows-stable):

```bash
sudo npm install --global yarn
```

Install `tree-sitter-cli` and `neovim` packages with `npm`:

```bash
sudo npm -g install tree-sitter-cli
sudo npm -g install neovim
```

Install `python`:

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
