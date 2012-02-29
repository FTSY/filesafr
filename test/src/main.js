require.config({
  paths: vendorjsPaths({filesafr: "../../src"}, "../../vendor")
});

QUnit.config.autostart = false;

require([
  "cs!core_test",
  "cs!observable_test",
  "cs!uploader_test",
  "cs!basic_file_test",
  "cs!servers/zhost_test"
  ], function() { QUnit.start(); });
