define ["cs!filesafr/servers/anonfiles", "cs!test_helper"], (Anonfiles, h) ->
  module "Servers - Anonfiles"

  test "uploading a file", ->
    QUnit.stop()

    file = h.sampleBlob()
    host = new Anonfiles()

    host.upload(file, filename: "example.txt", oncomplete: (uploadInfo) ->
      ok uploadInfo.isUploaded(), "file was uploaded: #{uploadInfo.error}"
      ok uploadInfo.file().downloadPath().match(h.testReURL), "valid file download URL: #{uploadInfo.file().downloadPath()}"

      QUnit.start()
    )
