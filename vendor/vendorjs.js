(function() {
  var libPaths = {
    // requireJS plugins
    cs:    "cs",
    text:  "text",
    order: "order",

    // libraries
    jquery:    "jquery-1.7.1.min",
    ember:     "ember-loader",
    ember_lib: "ember-0.9.5",
  };

  window.vendorjsPaths = function vendorjsPaths(paths, prefix) {
    prefix = prefix || "../vendorjs";
    var obj = {}, k;

    for (k in libPaths) { obj[k] = prefix + "/" + libPaths[k]; }
    for (k in paths) { obj[k] = paths[k]; }

    return obj;
  }
})();
