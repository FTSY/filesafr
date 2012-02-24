FileSafr.Uploader = class Uploader
  mix @::, FileSafr.Observable

  constructor: (options = {}) ->
    # listen to all events (options that starts with "on")
    for opt, fn of options
      @addListener(match[1], fn) if match = opt.match(/^on(.+)/)

  upload: (targetUrl, formData) ->
    xhr = new XMLHttpRequest()
    xhr.open("POST", targetUrl, true)
    xhr.send(formData)
