define ["cs!filesafr/core", "cs!filesafr/observable"], (h, Observable) ->
  class Uploader
    h.mix @::, Observable

    constructor: (options = {}) ->
      # listen to all events (options that starts with "on")
      for opt, fn of options
        @addListener(match[1], fn) if match = opt.match(/^on(.+)/)

    upload: (targetUrl, formData, InfoClass) ->
      xhr = new XMLHttpRequest()
      xhr.open("POST", targetUrl, true)
      xhr.onreadystatechange = (e) =>
        if xhr.readyState == 4
          info = new InfoClass(xhr)
          @triggerEvent("complete", info)

      xhr.send(formData)
