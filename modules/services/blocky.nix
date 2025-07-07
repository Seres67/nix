{
  lib,
  config,
  ...
}: {
  options = {
    blocky = {
      openToLan = lib.mkEnableOption "enables access from LAN network.";
    };
  };

  config = {
    services.blocky = {
      enable = true;
      settings = {
        ports.dns = 53;
        upstreams.groups.default = [
          "https://dns.quad9.net/dns-query"
        ];
        bootstrapDns = {
          upstream = "https://dns.quad9.net/dns-query";
          ips = ["9.9.9.9" "149.112.112.112"];
        };
        blocking = {
          denyLists = {
            ads = [
              "https://big.oisd.nl/domainswild"
              "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/pro.txt"
              # NOTE: These aren't compatible
              # "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
              # "https://adguardteam.github.io/AdguardFilters/FrenchFilter/sections/adservers.txt"
              # "https://raw.githubusercontent.com/easylist/easylist/master/easylist/easylist_adservers.txt"
              # "https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_trackingservers.txt"
            ];
          };
          clientGroupsBlock = {
            default = ["ads"];
          };
        };
      };
    };

    networking = {
      nameservers = [
        "127.0.0.1"
        "9.9.9.9"
      ];

      networkmanager.insertNameservers = [
        "127.0.0.1"
        "9.9.9.9"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf config.blocky.openToLan [
      53
    ];
  };
}
