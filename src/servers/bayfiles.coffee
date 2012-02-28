define ["jquery", "cs!filesafr/uploader", "cs!filesafr/core", "cs!filesafr/basic_file", "cs!filesafr/upload_info"], ($, Uploader, h, BasicFile, UploadInfo) ->
  class Bayfile extends BasicFile
    constructor: (@info) ->
      @path = info.downloadUrl

  class BayUpload extends UploadInfo
    parseInfo: ->
      info = $.parseJSON(@response.responseText)

      @fileinfo = new Bayfile(info) if @isStatusOk()

  class Bayfiles
    upload: (file, options = {}) ->
      filename = h.extractOption(options, "filename") || file.name || null

      $.getJSON "http://api.bayfiles.com/v1/file/uploadUrl", (json) ->
        fd = new FormData()
        fd.append("file", file, filename)

        uploader = new Uploader(options)
        uploader.upload(json.uploadUrl, fd, BayUpload)
        uploader
