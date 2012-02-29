define ["cs!filesafr/servers/anonfiles", "cs!test_helper"], (Anonfiles, h) ->
  module "Servers - Anonfiles"

  test "uploading a file", ->
    QUnit.stop()

    file = h.sampleBlob()
    host = new Anonfiles()

    host.upload(file, filename: "example.txt", oncomplete: (e, upload) ->
      ok upload, "make success request"

      if upload
        upload.download (content) ->
          h.compareFiles content, file, (result) ->
            ok result, "files are equals"

            QUnit.start()

      else
        QUnit.start()
    )
