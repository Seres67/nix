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
        "io" = {id = "6C4JU65-7GAO2QK-BTJLI4I-673GVLB-XFUEARK-RX6FRXA-ANZVY4O-WHOCCAN";};
        "nessus" = {id = "644TS26-NDPT7FP-OEHKA6D-72T6I4F-7CBLOJO-VBOLELS-DHFKYX6-G22H3AY";};
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
