# Dotfiles

Personal configuration files managed with Nix and Home Manager.

## Components

- **Neovim** - Text editor with Lua configuration
- **Zsh** - Shell with customizations
- **Tmux** - Terminal multiplexer
- **Kitty** - Terminal emulator with themes
- **Starship** - Cross-shell prompt
- **Nix/Home Manager** - Configuration management

## Requirements

- [Nix](https://zero-to-nix.com/start/install) with Flakes enabled

## Setup

```bash
cd nix
nix run github:nix-community/home-manager/release-25.11 -- init --switch .
```

Home Manager will create symlinks to your configuration files:
- `~/.config/nvim` → Neovim configuration
- `~/.tmux.conf` → Tmux configuration
- `~/.zshrc` → Zsh configuration

## Notes

- Home Manager installs GUI and CLI applications defined in `home.nix`
- Configuration files are symlinked from this repository
- Review `home.nix` to customize packages and settings
