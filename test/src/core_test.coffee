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
