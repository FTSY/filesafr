define ["cs!filesafr/uploader", "cs!filesafr/core"], (Uploader, c) ->
  class BaseServer
    uploadUrl: -> null

    createFormData: (file, options) ->
      new FormData()

    upload: (file, options = {}) ->
      opts = @parseUploadOptions(options)
      @createUploader(@createFormData(file, opts), opts)

    createUploader: (fd, opt, customData) ->
      uploader = new Uploader(@uploadUrl(), fd, customData)
      uploader.addListener "progress", opt.progress if opt.progress?
      uploader.addListener "complete", opt.complete if opt.complete?
      uploader.send()
      uploader

    parseUploadOptions: (options) ->
      opts = c.mix({}, options)
      opts.progress = ((e) => options.onprogress(e, @parseProgress(e))) if options.onprogress?
      opts.complete = ((e) => options.oncomplete(e, @parseComplete(e))) if options.oncomplete?

      opts

    parseProgress: (e) ->
    parseSuccess: (e) ->
    parseFailure: (e) ->
    parseComplete: (e) ->
      xhr = e.target

      if xhr.status >= 200 and xhr.status < 300
        @parseSuccess(e)
      else
        @parseFailure(e)
