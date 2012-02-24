window.mix = (prot, mixes...) ->
  for mixin in mixes
    for key, value of mixin
      prot[key] = value
