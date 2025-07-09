_: {
  services.openssh = {
    enable = true;
    PermitRootLogin = "no";
    PasswordAuthentication = false;
    openFirewall = true;
  };
  users.users.seres.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFomO3vJYFu3cQjt/7Q6PZ4jTcDBMi2Gsle4yxNUjOY seres@europa"
  ];
}
