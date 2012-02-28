window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem

define
  testReURL: /^[a-z]+:\/\/.+$/
  sampleBlob: ->
    builder = new WebKitBlobBuilder()
    builder.append "Some text content"
    builder.getBlob("text/plain")
