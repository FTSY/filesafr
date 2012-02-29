window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem

define ["cs!filesafr/image_generator", "cs!filesafr/core"], (generateImage, core) ->
  testReURL: /^[a-z]+:\/\/.+$/
  sampleBlob: ->
    builder = new WebKitBlobBuilder()
    builder.append "Some text content"
    builder.getBlob("text/plain")

  sampleImage: (maskedContent = null) ->
    data = core.byteArrayFromDataURL(generateImage())

    builder = new WebKitBlobBuilder()
    builder.append data.buffer
    builder.append maskedContent if maskedContent
    builder.getBlob("image/png")
