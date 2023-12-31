{ pkgs, lib, user, ... }:

{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.makeBinPath [pkgs.greetd.tuigreet]}/tuigreet --time --cmd Hyprland";
      };
    };
  };
}
