define ->
  class UploadInfo
    constructor: (@response) ->
      @parseInfo()

    isUploaded: ->
      @response.status >= 200 and @response.status < 300 and @file()

    file: -> @fileinfo
