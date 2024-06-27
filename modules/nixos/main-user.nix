{ lib, config, pkgs, ... }:

{
  options = {
    main-user.enable = lib.mkEnableOption "enable user module";

    main-user.userName = lib.mkOption {
      default = "ozerova";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf config.main-user.enable {
    users.users.${config.main-user.userName} = {
      isNormalUser = true;
      description = "Alexei Ozerov";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
        neovim
        neofetch
	pulseaudio
	alsa-lib
        emacs
        zsh
        oh-my-zsh
        wget
        curl
        git
        gnumake
        gcc
        kitty
        tmux
	nvtop
	ripgrep
	rofi
	sbcl
	rust-analyzer
	gleam
	go
	cargo
	lshw
	hyprpaper
	raylib
	clang
	ccls
	jetbrains-mono
      ];
    };
  };
}
