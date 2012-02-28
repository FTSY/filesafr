window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem

define ["cs!filesafr/image_generator", "cs!filesafr/core"], (generateImage, core) ->
  testReURL: /^[a-z]+:\/\/.+$/
  sampleBlob: ->
    builder = new WebKitBlobBuilder()
    builder.append "Some text content"
    builder.getBlob("text/plain")

  sampleImage: ->
    data = core.byteArrayFromDataURL(generateImage())
    console.log "Generated image", data

    builder = new WebKitBlobBuilder()
    builder.append data.buffer
    builder.getBlob("image/png")
