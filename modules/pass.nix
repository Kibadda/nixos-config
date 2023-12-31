{ pkgs, user, ... }:

{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "$HOME/.password-store";
      PASSWORD_STORE_KEY = user.email;
    };
  };
}
