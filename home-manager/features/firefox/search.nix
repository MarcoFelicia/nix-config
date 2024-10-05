{
  force = true;
  default = "Brave";
  engines = {
    "Brave" = {
      urls = [
        { template = "https://search.brave.com/search?q={searchTerms}"; }
        {
          template = "https://search.brave.com/api/suggest?q={searchTerms}";
          type = "application/x-suggestions+json";
        }
      ];
      iconUpdateURL = "https://brave.com/static-assets/images/brave-favicon.png";
      updateInterval = 24 * 60 * 60 * 1000;
      definedAliases = [ "@brave" ];
    };

    # "Google".metaData.hidden = true;
    "eBay".metaData.hidden = true;
    "Wikipedia (en)".metaData.hidden = true;
    "DuckDuckGo".metaData.hidden = true;
    "Bing".metaData.hidden = true;
  };
}
