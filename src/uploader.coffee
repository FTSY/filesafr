define ["cs!filesafr/core", "cs!filesafr/observable"], (h, Observable) ->
  class Uploader
    h.mix @::, Observable

    constructor: (@url, @data, @customData = {}) ->

    send: ->
      xhr = new XMLHttpRequest()
      xhr.open("POST", @url, true)
      xhr.onreadystatechange = @stateChanged
      xhr.send(@data)

      this

    stateChanged: (e) =>
      xhr = e.target

      if xhr.readyState == 4
        e.customData = @customData
        @triggerEvent("complete", e)
