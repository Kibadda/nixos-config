{ user, location, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    syntaxHighlighting.enable = true;

    history.expireDuplicatesFirst = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ${location}/#titania";
      ls = "exa --icons";
      ll = "exa -l --icons";
      la = "exa -la --icons";
      cat = "bat";
      conf = "cd ${location}";
      pi-connect = "sshfs webserver:/home/user/lua-webserver ~/raspberry/webserver";
    };

    initExtra = ''
      export KEYID=${user.keyid}
      export GPG_TTY="$(tty)"
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent

      export TOBI=0x4b7228cfe59b7380
    '';
  };
}
