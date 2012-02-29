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

  compareFiles: (blob1, blob2, callback) ->
    reader1 = new FileReader()
    reader1.onload = (e1) ->
      reader2 = new FileReader()
      reader2.onload = (e2) ->
        buffer1 = new Uint8Array(e1.target.result)
        buffer2 = new Uint8Array(e2.target.result)

        if buffer1.length != buffer2.length
          callback(false)
        else
          i = 0

          while i < buffer1.length
            if buffer1[i] != buffer2[i]
              callback(false)
              break

            i += 1

          callback(true)

      reader2.readAsArrayBuffer(blob2)
    reader1.readAsArrayBuffer(blob1)
