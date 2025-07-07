_: {
  services.pihole-web = {
    # enable = true;
    ports = [
      80
    ];
  };
  services.pihole-ftl = {
    # enable = true;
    lists = [
      {
        url = "https://big.oisd.nl";
      }
      {
        url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt";
      }
    ];
  };

  networking.nameservers = [
    # "127.0.0.1"
    "9.9.9.9"
  ];

  networking.networkmanager.insertNameservers = [
    # "127.0.0.1"
    "9.9.9.9"
  ];
}
