define ["cs!filesafr/servers/base", "cs!filesafr/basic_file", "cs!filesafr/image_generator"], (Server, BasicFile, generator) ->
  class ImageMaskedFile extends BasicFile
    constructor: (@url, @skipSize) ->

    download: (callback) ->
      @fetchBlob (file) =>
        callback(file.webkitSlice(file.size - @skipSize))

  class ZHost extends Server
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
        new ImageMaskedFile(match[1], e.customData.originalSize)
      else
        console.log("can't match url on result", e)
        null

    upload: (file, options = {}) ->
      opts = @parseUploadOptions(options)
      fileInfo =
        originalSize: file.size

      maskedFile = generator.maskData(file)

      uploader = @createUploader(@createFormData(maskedFile, opts), opts, fileInfo)
