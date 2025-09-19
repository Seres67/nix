_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    settings = {
      devices = {
        "rpi" = {id = "TON2NU7-TBSTUMF-5FPHZGC-SLGA2LZ-VNEMCB6-IQGN56B-KYESWLQ-I5HZTQV";};
        "Pixel 8a" = {id = "A5VDEUP-J23UWM6-OP4PHUL-FLFEXKD-KFNVUVV-A5U6U5W-PPS2MR6-NCYNMQ5";};
      };
      folders = {
        "s9cb7-umi75" = {
          path = "/home/seres/sync";
          devices = ["rpi" "Pixel 8a" "io" "nessus"];
        };
      };
    };
  };
}
