FileSafr.Uploader = Ember.Object.extend
  init: (options = {}) ->
    # listen to all events (options that starts with "on")
    for opt, fn of options
      Ember.addListener(this, opt, fn) if opt.match(/^on/)

  upload: (targetUrl, formData) ->
    xhr = new XMLHttpRequest()
    xhr.open("POST", targetUrl, true)
    xhr.send(formData)
