{
  programs.wofi = {
    enable = true;
  };

  home.file = {
    ".config/wofi/config" = {
      text = ''
        width=280
        lines=10
        xoffset=5
        yoffset=5
        location=1
        prompt=Search...
        filter_rate=100
        allow_markup=false
        no_actions=true
        halign=fill
        orientation=vertical
        content_halign=fill
        insensitive=true
        allow_images=true
        image_size=20
        hide_scroll=true
      '';
    };

    ".config/wofi/style.css" = {
      text = ''
        window {
          margin: 0px;
          background-color: #545454;
        }

        #input {
          all: unset;
          min-height: 20px;
          padding: 4px 10px;
          margin: 4px;
          border: none;
          color: #dfdfdf;
          font-weight: bold;
          background-color: #545454;
          outline: #dfdfdf;
        }

        #inner-box {
          font-weight: bold;
          border-radius: 0px;
        }

        #outer-box {
          margin: 0px;
          padding: 3px;
          border: none;
          border-radius: 10px;
          border: 3px solid #eeeeee;
        }

        #text:selected {
          color: #282c34;
          background-color: transparent;
        }

        #entry:selected {
          background-color: #eeeeee;
        }
      '';
    };

    ".config/wofi/power.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        entries="Suspend\nReboot\nShutdown\nLogout"

        selected=$(echo -e $entries | wofi --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

        case $selected in
          suspend)
            exec systemctl suspend;;
          reboot)
            exec systemctl reboot;;
          shutdown)
            exec systemctl poweroff -i;;
          logout)
            exec loginctl terminate-session self;;
        esac
      '';
    };
  };
}
