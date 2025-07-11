_: {
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    extraComponents = [
      "tplink"
      "tplink_tapo"
      "stream"

      # Components required to complete the onboarding
      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
      # Recommended for fast zlib compression
      # https://www.home-assistant.io/integrations/isal
      "isal"
    ];
    config = {
      default_config = {};
      homeassistant = {
        name = "Home";
        unit_system = "metric";
        time_zone = "Europe/Paris";
        temperature_unit = "C";
        latitude = 48.584614;
        longitude = 7.750713;
      };
    };
  };
}
