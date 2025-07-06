{ config, pkgs, lib, ... }:

{
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      scrollMethod = "twofinger";
      disableWhileTyping = true;
    };
  };
}
