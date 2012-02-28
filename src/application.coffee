define ["ember", "cs!filesafr/ui/progress_bar", "cs!filesafr/image_generator"], (E, ProgressBar, generateImage) ->
  ->
    app = E.Application.create()
    app.set("progressValue", 0)

    img = document.createElement("img")
    img.src = generateImage()

    document.body.appendChild(img)

    # extern required api's for Ember
    window.FileSafr =
      Application: app
      ProgressBar: ProgressBar
