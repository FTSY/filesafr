require.config({
  paths: vendorjsPaths({filesafr: "../../src"}, "../../vendor")
});

QUnit.config.autostart = false;

require([
  "cs!core_test",
  "cs!observable_test",
  "cs!uploader_test",
  "cs!servers/anonfiles_test",
  "cs!servers/bayfiles_test"
  ], function() { QUnit.start(); });
