define ["cs!filesafr/servers/zhost", "cs!test_helper"], (ZHost, h) ->
  module "Servers - ZHost"

  test "uploading a file", ->
    QUnit.stop()

    file = h.sampleImage("fake content for image")
    host = new ZHost()

    host.upload(file, filename: "example.png", oncomplete: (e, upload) ->
      ok upload, "make success request"

      if upload
        upload.download (content) ->
          h.compareFiles content, file, (result) ->
            ok result, "files are equals"

            QUnit.start()

      else
        QUnit.start()
    )
