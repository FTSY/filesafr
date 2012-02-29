define ->
  class BasicFile
    constructor: (@url) ->

    download: (callback) -> @fetchBlob(callback)

    fetchBlob: (callback) ->
      xhr = new XMLHttpRequest()
      xhr.open("GET", @url, true)
      xhr.responseType = "arraybuffer"

      xhr.onload = (e) ->
        if xhr.status >= 200 and xhr.status < 300
          bb = new WebKitBlobBuilder()
          bb.append(xhr.response)

          callback(bb.getBlob(""))

      xhr.send(null)
