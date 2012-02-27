require.config({
  paths: vendorjsPaths({filesafr: "../../src"}, "../../vendor")
});

QUnit.config.autostart = false;

require(["cs!observable_test", "cs!uploader_test"], function() {
  QUnit.start();
});
