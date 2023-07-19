{ pkgs, user, ... }:

{
  imports = [
    ../modules/hyprland/home.nix
    ../modules/kitty.nix
    ../modules/git.nix
    ../modules/zsh.nix
    ../modules/waybar.nix
    ../modules/rofi/default.nix
    ../modules/gnupg.nix
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      KEYID = user.keyid;
      TOBI = "0x4b7228cfe59b7380";
    };

    packages = with pkgs; [
      killall
      btop
      zip
      unzip
      tree
      bat
      exa
      usbutils

      yubikey-touch-detector

      grim
      slurp

      vim
      google-chrome
      telegram-desktop

      pamixer
      brightnessctl

      cargo
      nodejs
      clang
      wl-clipboard
      fd
      ripgrep
      tree-sitter
      neovim
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
