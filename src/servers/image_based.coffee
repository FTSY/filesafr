define ["cs!filesafr/servers/base", "cs!filesafr/basic_file", "cs!filesafr/image_generator"], (Server, BasicFile, generator) ->
  class ImageMaskedFile extends BasicFile
    constructor: (@url, @skipSize) ->

    download: (callback) ->
      @fetchBlob (file) =>
        if file
          callback(file.webkitSlice(file.size - @skipSize))
        else
          callback(null)

  class ImageBasedServer extends Server
    @ImageFile: ImageMaskedFile

    upload: (file, options = {}) ->
      opts = @parseUploadOptions(options)
      fileInfo =
        originalSize: file.size

      maskedFile = generator.maskData(file)

      uploader = @createUploader(@createFormData(maskedFile, opts), opts, fileInfo)
