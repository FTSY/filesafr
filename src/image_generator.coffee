define ->
  CANVAS_WIDTH  = 20
  CANVAS_HEIGHT = 20

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

  ->
    canvas = getGeneratorCanvas()
    ctx = canvas.getContext("2d")
    ctx.clearRect(CANVAS_WIDTH, CANVAS_HEIGHT)

    for x in walkArrayX
      for y in walkArrayY
        ctx.fillRect(x, y, 1, 1) if Math.random() >= 0.5

    canvas.toDataURL("image/png")