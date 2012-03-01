define ["cs!filesafr/servers/image_based"], (Server) ->
  class FreeImageHosting extends Server
    name: -> "FreeImageHosting"
    uploadUrl: -> "http://www.freeimagehosting.net/upload.php"
    # maxSize: ->

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "attached", file, @imageName()
      fd.append "Submit", "Upload File"
      fd

    matchResponseOnText: (text) -> text.match /\[img\](.+?)\[\/img\]/

    upload: (file, options = {}) ->
      xhr = new XMLHttpRequest()
      xhr.open("GET", "http://www.freeimagehosting.net", true)
      xhr.onload = => Server::upload.call(this, file, options)
      xhr.send()
