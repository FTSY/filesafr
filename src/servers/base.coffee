# Copyright (c) 2012 FTSY
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

define ["cs!filesafr/uploader", "cs!filesafr/core"], (Uploader, c) ->
  class BaseServer
    name: -> "Unnamed Host"
    uploadUrl: -> null
    headers: ->

    createFormData: (file, options) ->
      new FormData()

    upload: (file, options = {}) ->
      opts = @parseUploadOptions(options)
      @createUploader(@createFormData(file, opts), opts)

    createUploader: (fd, opt, customData) ->
      uploader = new Uploader(@uploadUrl(), fd, customData, @headers())
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
