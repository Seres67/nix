{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wofi
  ];

  environment.etc."wofi/config".text = ''
    layer=overlay
    insensitive=true
  '';

  environment.etc."wofi/styles.css".text = ''
        * {
        font-family: FiraCode Nerd Font Mono Ret;
        font-size:16px;
    }

    window {
        background-color: #616161;
    }

    #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        border-bottom: 3px solid black;
        background-color: #242424;
        color: white;
    }

    #inner-box {
        background-color: #242424;
    }

    #outer-box {
        margin: 5px;
        padding:20px;
        background-color: #242424;
    }

    #scroll {
    }

    #text {
        padding: 5px;
        color: white;
    }

    #entry:nth-child(even){
        background-color: #4A4A4A;
    }

    #entry:selected {
        background-color: #737373;
    }

    #text:selected {
    }
  '';
}
