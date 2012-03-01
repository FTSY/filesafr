define ["cs!filesafr/servers/image_based"], (Server) ->
  class ImageShack extends Server
    name: -> "ImageShack"
    uploadUrl: -> "http://post.imageshack.us/"
    maxSize: -> 13145728

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "uploadtype", "on"
      fd.append "fileupload", file, @imageName()
      fd.append "url", ""
      fd.append "email", ""
      fd.append "MAX_FILE_SIZE", "13145728"
      fd.append "refer", "http://imageshack.us/"
      fd.append "brand", ""
      fd.append "optimage", "resample"
      fd.append "optsize", "resample"
      fd.append "rembar", "1"
      fd

    parseSuccess: (e, opts) ->
      xhr = e.target
      match = xhr.responseText.match(/\[IMG\](.+?)\[\/IMG\]/)

      if match
        new Server.ImageFile(match[1], e.customData.originalSize)
      else
        console.error("can't match url on result", e)
        null
