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
  class ForFreeImage extends Server
    name: -> "4FreeImages"
    uploadUrl: -> "http://www.4freeimagehost.com/upload.php"
    # maxSize: -> TODO: realize max size

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "attached", file, @imageName()
      fd.append "MAX_FILE_SIZE", "150000"
      fd.append "submit", "Upload Image"
      fd

    matchResponseOnText: (text) ->
      url = text.match /\[img\](.+?)\[\/img\]/

      if url
        code = url[1].match /\/(.+)\.png$/

        if code
          [null, "http://www.4freeimagehost.com/uploads/#{code}.png"]
