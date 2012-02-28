define ["cs!filesafr/uploader", "cs!filesafr/core"], (Uploader, h) ->
  class Anonfile
    constructor: (@path) ->

    downloadPath: -> @path

  class UploadInfo
    constructor: (@response) ->
      @parseInfo()

    isUploaded: ->
      @response.status >= 200 and @response.status < 300 and @file()

    file: -> @fileinfo

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
      uploader.upload("https://anonfiles.com/en/upload", fd, UploadInfo)
      uploader
