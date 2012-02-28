define ->
  class UploadInfo
    constructor: (@response) ->
      @parseInfo()

    isStatusOk: ->
      @response.status >= 200 and @response.status < 300

    isUploaded: ->
      @isStatusOk() and @file()

    file: -> @fileinfo
