define ["ember", "cs!filesafr/ui/progress_bar"], (E, ProgressBar) ->
  ->
    app = E.Application.create()
    app.set("progressValue", 0)

    # extern required api's for Ember
    window.FileSafr =
      Application: app
      ProgressBar: ProgressBar
