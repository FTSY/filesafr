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

define ->
  class BasicFile
    constructor: (@url) ->

    download: (callback) -> @fetchBlob(callback)

    fetchBlob: (callback) ->
      xhr = new XMLHttpRequest()
      xhr.open("GET", @url, true)
      xhr.responseType = "arraybuffer"

      xhr.onreadystatechange = (e) ->
        if xhr.readyState == 4
          if xhr.status >= 200 and xhr.status < 300
            bb = new WebKitBlobBuilder()
            bb.append(xhr.response)

            callback(bb.getBlob("")) # TODO: identify file type by response headers
          else
            console.log "invalid response on download"
            callback(null)

      xhr.send(null)
