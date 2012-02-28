define ["ember", "cs!filesafr/core", "cs!filesafr/ui/progress_bar", "cs!filesafr/image_generator"], (E, core, ProgressBar, generateImage) ->
  ->
    app = E.Application.create()
    app.set("progressValue", 0)

    imgData = generateImage()

    img = document.createElement("img")
    img.src = imgData

    byteArray = core.byteArrayFromDataURL(imgData)
    console.log byteArray

    document.body.appendChild(img)

    # extern required api's for Ember
    window.FileSafr =
      Application: app
      ProgressBar: ProgressBar
