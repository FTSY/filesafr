define ["cs!filesafr/servers/image_based"], (Server) ->
  class ZHost extends Server
    name: -> "ZHost"
    uploadUrl: -> "http://zhost.tk/"

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "file", file, @imageName()
      fd.append "submit", "Upload file"
      fd

    matchResponseOnText: (text) -> text.match(/value="(http:\/\/zhost\.tk\/.+?\.png)"/)
