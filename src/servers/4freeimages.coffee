define ["cs!filesafr/servers/image_based"], (Server) ->
  class ForFreeImage extends Server
    name: -> "4FreeImages"
    uploadUrl: -> "http://www.4freeimagehost.com/upload.php"
    # maxSize: -> TODO: realize max size

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "attached", file, @imageName()
      fd.append "MAX_FILE_SIZE", "150000"
      fd.append "submit", "Upload Image"
      fd

    matchResponseOnText: (text) ->
      url = text.match /\[img\](.+?)\[\/img\]/

      if url
        code = url[1].match /\/(.+)\.png$/

        if code
          [null, "http://www.4freeimagehost.com/uploads/#{code}.png"]
