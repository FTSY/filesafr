define ["jquery", "cs!filesafr/uploader", "cs!filesafr/core"], ($, Uploader, h) ->
  class Bayfile
    constructor: (@info) ->
      @path = info.downloadUrl

    downloadPath: -> @path

  class UploadInfo
    constructor: (@response) ->
      @parseInfo()

    isUploaded: ->
      @response.status >= 200 and @response.status < 300 and @file()

    file: -> @fileinfo

    parseInfo: ->
      info = $.parseJSON(@response.responseText)

      @fileinfo = new Bayfile(info)

  class Anonfiles
    upload: (file, options = {}) ->
      filename = h.extractOption(options, "filename") || file.name || null

      $.getJSON "http://api.bayfiles.com/v1/file/uploadUrl", (json) ->
        fd = new FormData()
        fd.append("file", file, filename)

        uploader = new Uploader(options)
        uploader.upload(json.uploadUrl, fd, UploadInfo)
        uploader
