define ["cs!filesafr/servers/zhost", "cs!test_helper"], (ZHost, h) ->
  module "Servers - ZHost"

  test "uploading a file", ->
    QUnit.stop()

    file = h.sampleBlob()
    host = new ZHost()

    host.upload(file, oncomplete: (e, upload) ->
      ok upload, "make success request"

      if upload
        upload.download (content) ->
          h.compareFiles content, file, (result) ->
            ok result, "files are equals"

            QUnit.start()

      else
        QUnit.start()
    )
