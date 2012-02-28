define ["cs!filesafr/servers/bayfiles", "cs!test_helper"], (Bayfiles, h) ->
  module "Servers - Bayfiles"

  test "uploading a file", ->
    QUnit.stop()

    file = h.sampleBlob()
    host = new Bayfiles()

    host.upload(file, filename: "example.txt", oncomplete: (uploadInfo) ->
      ok uploadInfo.isUploaded(), "file was uploaded: #{uploadInfo.error}"
      ok uploadInfo.file().downloadPath().match(h.testReURL), "valid file download URL: #{uploadInfo.file().downloadPath()}" if uploadInfo.isUploaded()

      QUnit.start()
    )
