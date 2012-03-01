define ["cs!filesafr/servers_list", "cs!test_helper"], (servers, h) ->
  return unless location.href.match /\?.*servers=true.*$/
  module "Servers"

  for server in servers
    ((host) ->
      test host.name(), ->
        QUnit.stop()

        file = h.sampleBlob()

        host.upload file, oncomplete: (e, upload) ->
          ok upload, "make success request"

          if upload
            upload.download (content) ->
              if content
                h.compareFiles content, file, (result) ->
                  ok result, "files are equals"

                  QUnit.start()
              else
                ok false, "can't download file", upload
                QUnit.start()

          else
            QUnit.start()
    )(new server())
