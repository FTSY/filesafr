require.config({
  paths: vendorjsPaths({filesafr: "../../src"}, "../../vendor")
});

QUnit.config.autostart = false;

require([
  "cs!observable_test",
  "cs!uploader_test",
  "cs!servers/anonfiles_test"
  ], function() { QUnit.start(); });
