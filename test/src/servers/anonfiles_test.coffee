define ["cs!filesafr/servers/anonfiles", "cs!test_helper"], (Anonfiles, th) ->
  module "Servers - Anonfiles"

  test "uploading a file", ->
    QUnit.stop()

    builder = new WebKitBlobBuilder()
    builder.append "Some text content"
    file = builder.getBlob("text/plain")

    host = new Anonfiles()

    host.upload(file, filename: "example.txt", oncomplete: (uploadInfo) ->
      ok uploadInfo.isUploaded(), "file was not uploaded: #{uploadInfo.error}"
      ok uploadInfo.file().downloadPath().match(th.testReURL), "invalid file download URL: #{uploadInfo.downloadPath}"

      QUnit.start()
    )
