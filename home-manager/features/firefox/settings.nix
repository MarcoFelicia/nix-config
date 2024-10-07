lib: config:
with lib;
{
  # telematry
  "app.shield.optoutstudies.enabled" = false;
  "browser.discovery.enabled" = false;
  "browser.newtabpage.activity-stream.feeds.telemetry" = false;
  "browser.newtabpage.activity-stream.telemetry" = false;
  "browser.ping-centre.telemetry" = false;
  "datareporting.healthreport.service.enabled" = false;
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false;
  "datareporting.sessions.current.clean" = true;
  "devtools.onboarding.telemetry.logged" = false;
  "toolkit.telemetry.archive.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;
  "toolkit.telemetry.hybridContent.enabled" = false;
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.prompted" = 2;
  "toolkit.telemetry.rejected" = true;
  "toolkit.telemetry.reportingpolicy.firstRun" = false;
  "toolkit.telemetry.server" = "";
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.unifiedIsOptIn" = false;
  "toolkit.telemetry.updatePing.enabled" = false;

  # disable first run
  "browser.disableResetPrompt" = true;
  "browser.download.panel.shown" = true;
  "browser.feeds.showFirstRunUI" = false;
  "browser.messaging-system.whatsNewPanel.enabled" = false;
  "browser.rights.3.shown" = true;
  "browser.shell.checkDefaultBrowser" = false;
  "browser.shell.defaultBrowserCheckCount" = 1;
  "browser.startup.homepage_override.mstone" = "ignore";
  "browser.uitour.enabled" = false;
  "startup.homepage_override_url" = "";
  "trailhead.firstrun.didSeeAboutWelcome" = true;
  "browser.bookmarks.restore_default_bookmarks" = false;
  "browser.bookmarks.addedImportButton" = true;

  # disable about:config warning
  "browser.aboutConfig.showWarning" = false;

  # clean home page
  "browser.newtabpage.activity-stream.feeds.topsites" = false;
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.showSponsored" = false;
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

  # disable recommend extensions and features
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;

  # disable fx accounts
  "identity.fxaccounts.enabled" = false;

  # disable pocket
  "extensions.pocket.enabled" = false;

  # tracking protection
  "browser.contentblocking.category" = "strict";
  "network.http.referer.XOriginPolicy" = 2;

  # disable autofill
  "signon.rememberSignons" = false;
  "extensions.formautofill.addresses.enabled" = false;
  "extensions.formautofill.creditCards.enabled" = false;

  # disable spellcheck
  "layout.spellcheckDefault" = 0;

  # history settings
  "places.history.enabled" = false;
  "browser.formfill.enable" = false;
  "privacy.clearOnShutdown_v2.siteSettings" = true;
  "privacy.sanitize.sanitizeOnShutdown" = true;

  # auto upgrade https
  "dom.security.https_only_mode" = true;
  "security.OCSP.require" = true;

  # middlemouse paste
  "middlemouse.paste" = false;

  # auto highlight all matches when search
  "findbar.highlightAll" = true;

  # clean address bar
  "browser.urlbar.suggest.history" = false;
  "browser.urlbar.suggest.openpage" = false;
  "browser.urlbar.suggest.topsites" = false;

  # no picture-in-picture
  "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

  # autoload extensions
  "extensions.autoDisableScopes" = 0;

  # bookmark toolbar
  "browser.toolbars.bookmarks.visibility" = "never";

  #disable tooltip
  "ui.tooltip.delay_ms" = -1;

  #theme
  "browser.theme.content-theme" = 0;
  "browser.theme.toolbar-theme" = 0;
  "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
}
// (optionalAttrs config.custom.theme.firefox.enable {
  # userChrome
  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

  # browser devtool
  "devtools.toolbox.host" = "window";
  "devtools.chrome.enabled" = true;
  "devtools.debugger.remote-enabled" = true;
})
