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

define ["cs!filesafr/servers/image_based"], (Server) ->
  class MojoImage extends Server
    name: -> "MojoImage"
    uploadUrl: -> "http://www.mojoimage.com/free-image-hosting.php"
    # maxSize: -> 13145728 # 12 MB

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "userfile", file, @imageName()
      fd.append "upload", "Uploading..."
      fd

    matchResponseOnText: (text) -> text.match /\[IMG\](.+?)\[\/IMG\]/

    upload: (file, options = {}) ->
      xhr = new XMLHttpRequest()
      xhr.open("GET", "http://mojoimage.com", true)
      xhr.onload = => Server::upload.call(this, file, options)
      xhr.send()
