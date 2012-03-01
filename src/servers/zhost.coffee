define ["cs!filesafr/servers/image_based"], (Server) ->
  class ZHost extends Server
    name: -> "ZHost"
    uploadUrl: -> "http://zhost.tk/"

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "file", file, "file.png" # TODO: randomize file name
      fd.append "submit", "Upload file"
      fd

    parseSuccess: (e, opts) ->
      xhr = e.target
      match = xhr.responseText.match(/value="(http:\/\/zhost\.tk\/.+?\.png)"/)

      if match
        new Server.ImageFile(match[1], e.customData.originalSize)
      else
        console.error("can't match url on result", e)
        null
