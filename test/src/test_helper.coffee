window.requestFileSystem = window.requestFileSystem || window.webkitRequestFileSystem

define
  testReURL: /^[a-z]+:\/\/.+$/
  getFixtureFile: (callback) ->
    err = ->
      console.log("Error requesting file system")
      console.log(arguments)

      callback(null)

    window.requestFileSystem(window.TEMPORARY, 1024 * 1024, ((fs) ->
      fs.root.getFile("upload_sample.txt", {create: true, exclusive: false}, ((file) ->
        console.log "writing file"

        file.createWriter(((writer) ->
          writer.onwriteend = -> callback(file)

          builder = new WebKitBlobBuilder()
          builder.append "Some text content"
          writer.write(builder.getBlob("text/plain"))
        ), err)
      ), err)
    ), err)
