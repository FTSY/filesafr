window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem

define ["cs!filesafr/image_generator", "cs!filesafr/core"], (imageGenerator, core) ->
  testReURL: /^[a-z]+:\/\/.+$/
  sampleBlob: ->
    SIZE = 1024
    buffer = new ArrayBuffer(SIZE)
    i = 0

    uarray = new Uint8Array(buffer)
    while i < SIZE
      uarray[i] = Math.round(Math.random() * 255)
      i += 1

    builder = new WebKitBlobBuilder()
    builder.append uarray.buffer
    builder.getBlob("text/plain")

  sampleImage: (maskedContent = null) -> imageGenerator.maskData(maskedContent)

  compareFiles: (blob1, blob2, callback) ->
    reader1 = new FileReader()
    reader1.onload = (e1) ->
      reader2 = new FileReader()
      reader2.onload = (e2) ->
        buffer1 = new Uint8Array(e1.target.result)
        buffer2 = new Uint8Array(e2.target.result)

        console.log buffer1, buffer2

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
