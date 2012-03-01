define ["cs!filesafr/servers/image_based"], (Server) ->
  class MojoImage extends Server
    name: -> "MojoImage"
    uploadUrl: -> "http://www.mojoimage.com/free-image-hosting.php"
    # maxSize: -> 13145728 # 12 MB

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "userfile", file, @imageName()
      fd.append "upload", "Uploading..."
      fd

    matchResponseOnText: (text) -> text.match /\[IMG\](.+?)\[\/IMG\]/
