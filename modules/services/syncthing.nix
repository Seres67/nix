_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "seres";
    dataDir = "/home/seres";
    settings = {
      devices = {
        "rpi" = {id = "TON2NU7-TBSTUMF-5FPHZGC-SLGA2LZ-VNEMCB6-IQGN56B-KYESWLQ-I5HZTQV";};
        "Pixel 8a" = {id = "A5VDEUP-J23UWM6-OP4PHUL-FLFEXKD-KFNVUVV-A5U6U5W-PPS2MR6-NCYNMQ5";};
        "io" = {id = "I7M6LCM-GQH2EP2-IGTJ77Y-4VWBZNV-RZ3B3OO-TRGDDWX-WRTKMLU-GRVDIQ7";};
        "nessus" = {id = "HXMOGNN-PS5BDAD-ITEWLHY-GDXUJDI-NA754JW-46MKF6U-BWYVHUE-AFU46AU";};
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
