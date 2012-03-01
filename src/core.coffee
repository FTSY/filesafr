define ["base64_binary"], (base) ->
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

  byteArrayFromDataURL: (data) ->
    base.decode(data.replace(/^data:.+?;base64,/, ""))

  parseUrlBase: (url) ->
    (url + "").split("/").slice(0, 3).join("/")
