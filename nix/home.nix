{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abhilash";
  home.homeDirectory = "/home/abhilash";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # GUI apps
    chromium
    gimp
	wireshark

    # dev tools
    neovim
    yazi
    kitty
    tmux
    zsh
	lazygit
	meld

    # CLI 
    git-lfs
    openvpn
    pre-commit
    htop
    btop

    # other
	libgcc
    fzf
    ripgrep
    cargo

    # Fonts & icons
    starship

	# LSP
	bash-language-server
	cmake-language-server
	gdb
	hotspot
	lua-language-server
	nil
	pyright
	valgrind
	vscode-extensions.rust-lang.rust-analyzer
  ];

  home.file = {
    ".tmux.conf" = {
    	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/git/dot_config/tmux/.tmux.conf";
     };

    ".zshrc" = {
      	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/git/dot_config/zsh/.zshrc";
     };

    ".config/nvim" = {
    	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/git/dot_config/nvim";
     };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      settings.user.name = "Abhilash";
      settings.user.email = "abhilash.nandkumar@gmail.com";
	  lfs.skipSmudge = true;
    };
	gcc.enable = true;
  };
}
