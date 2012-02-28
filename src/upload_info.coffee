define ->
  class UploadInfo
    constructor: (@response) ->
      @parseInfo()

    isUploaded: ->
      @response.status >= 200 and @response.status < 300 and @file()

    file: -> @fileinfo

    parseInfo: ->
      info = $.parseJSON(@response.responseText)

      @fileinfo = new Bayfile(info)
