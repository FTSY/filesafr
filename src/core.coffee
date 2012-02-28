define
  mix: (prot, mixes...) ->
    for mixin in mixes
      for key, value of mixin
        prot[key] = value

  extractOption: (hash, key) ->
    if hash[key]?
      value = hash[key]
      delete hash[key]
      value
    else
      null
