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

define ["cs!filesafr/core"], (core) ->
  CANVAS_WIDTH  = 10
  CANVAS_HEIGHT = 10

  getGeneratorCanvas = ->
    canvas = document.getElementById("_imageGeneratorCanvas")

    unless canvas
      canvas = document.createElement("canvas")
      canvas.id = "_imageGeneratorCanvas"
      canvas.width = CANVAS_WIDTH
      canvas.height = CANVAS_HEIGHT
      canvas.style.display = "none"

      document.body.appendChild(canvas)

    canvas

  walkArrayX = [0...CANVAS_WIDTH]
  walkArrayY = [0...CANVAS_HEIGHT]

  imageData: ->
    canvas = getGeneratorCanvas()
    ctx = canvas.getContext("2d")
    ctx.clearRect(CANVAS_WIDTH, CANVAS_HEIGHT)

    for x in walkArrayX
      for y in walkArrayY
        ctx.fillRect(x, y, 1, 1) if Math.random() >= 0.5

    canvas.toDataURL("image/png")

  maskData: (data) ->
    imageData = core.byteArrayFromDataURL(@imageData())

    builder = new WebKitBlobBuilder()
    builder.append imageData.buffer
    builder.append data
    builder.getBlob("image/png")
