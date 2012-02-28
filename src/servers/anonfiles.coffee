define ["cs!filesafr/uploader", "cs!filesafr/core", "cs!filesafr/basic_file", "cs!filesafr/upload_info"], (Uploader, h, BasicFile, UploadInfo) ->
  class Anonfile extends BasicFile
    constructor: (@path) ->

  class AnonUpload extends UploadInfo
    parseInfo: ->
      url = @response.responseText.match(/http:\/\/cdn\.anonfiles\.com\/[^"]+/)[0]

      @fileinfo = new Anonfile(url)

  class Anonfiles
    upload: (file, options = {}) ->
      filename = h.extractOption(options, "filename") || file.name || null

      fd = new FormData()
      fd.append("input_file", file, filename)
      fd.append("upl", "Upload")

      uploader = new Uploader(options)
      uploader.upload("https://anonfiles.com/en/upload", fd, AnonUpload)
      uploader
