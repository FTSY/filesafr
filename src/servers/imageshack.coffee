define ["cs!filesafr/servers/image_based"], (Server) ->
  class ImageShack extends Server
    name: -> "ImageShack"
    uploadUrl: -> "http://post.imageshack.us/"
    maxSize: -> 13145728 # 12 MB

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

    matchResponseOnText: (text) -> text.match /\[IMG\](.+?)\[\/IMG\]/
