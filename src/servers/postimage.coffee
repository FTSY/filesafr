define ["cs!filesafr/servers/image_based"], (Server) ->
  class Postimage extends Server
    name: -> "Postimage"
    uploadUrl: -> "http://postimage.org/"

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "mode", "local"
      fd.append "areaid", ""
      fd.append "forumurl", "http://www.postimage.org/"
      fd.append "tpl", "."
      fd.append "ver", ""
      fd.append "addforum", ""
      fd.append "mforum", ""
      fd.append "um", "image"
      fd.append "ui", ""
      fd.append "hash", "198"
      fd.append "MAX_FILE_SIZE", "10485760"
      fd.append "upload[]", file, options.filename
      fd.append "optsize", "0"
      fd.append "adult", "no"
      fd.append "submit", "Upload It!"
      fd

    parseSuccess: (e) ->
      xhr = e.target
      match = xhr.responseText.match(/id="code_2".+?>.+?\[img\](.+?)\[\/img\]/)

      if match
        new Server.ImageFile(match[1], e.customData.originalSize)
      else
        console.error("can't match url on result", e)
        null
