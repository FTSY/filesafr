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

    imageName: -> "file.png" # TODO: make it random

    parseSuccess: (e) ->
      xhr = e.target
      match = @matchResponseOnText(xhr.responseText)

      if match
        new ImageMaskedFile(match[1], e.customData.originalSize)
      else
        console.error("can't match url on result", e)
        null

    matchResponseOnText: ->
