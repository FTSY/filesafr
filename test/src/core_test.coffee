define ["cs!filesafr/core"], (h) ->
  module "Core Helpers"

  test "mix one object into another", ->
    obj = {a: 1, b: 2}
    module = {c: 2, d: 3}
    other = {b: 5, c: 3}

    h.mix(obj, module, other)

    deepEqual({a: 1, b: 5, c: 3, d: 3}, obj)

  test "extract key from a hash", ->
    options = {a: 1, b: 2, c: 3}

    val = h.extractOption(options, "b")

    equal(2, val)
    deepEqual({a: 1, c: 3}, options)
    equal(null, options.b)

  test "extract inexistent option", ->
    options = {a: 1, b: 2, c: 3}

    val = h.extractOption(options, "d")
    equal(null, val)
    deepEqual({a: 1, b: 2, c: 3}, options)

  test "parse url domain with protocol", ->
    equal("http://www.google.com", h.parseUrlBase("http://www.google.com/search/something"))
    equal("https://www.google.com", h.parseUrlBase("https://www.google.com/search/something?andmore"))
    equal("http://mysite.de", h.parseUrlBase("http://mysite.de/upload"))
    equal("http://example.com", h.parseUrlBase("http://example.com"))
    equal("http://example.com", h.parseUrlBase("http://example.com/"))
    equal("null", h.parseUrlBase(null))
