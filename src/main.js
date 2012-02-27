require.config({
  paths: vendorjsPaths({filesafr: "."}, "../../vendor")
});

require(["cs!filesafr/application"], function(startApp) {
  startApp();
});
