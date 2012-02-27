({
  baseUrl: "src",

  paths: {
    filesafr: ".",

    // requireJS plugins
    cs:    "../vendor/cs",
    text:  "../vendor/text",
    order: "../vendor/order",

    // libraries
    jquery:    "../vendor/jquery-1.7.1.min",
    ember:     "../vendor/ember-loader",
    ember_lib: "../vendor/ember-0.9.5"
  },

  name: "main",
  out: "main-built.js"
})
