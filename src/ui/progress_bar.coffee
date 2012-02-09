window.FileSafr.UI.ProgressBar = Ember.View.extend
  tagName: "div"
  templateName: "progress-bar"
  classNames: ["progress-bar"]
  internalValue: 0

  value: ((key, value) ->
    if arguments.length == 1
      @get("internalValue")
    else
      pct = @normalizeValue(value)
      @set("internalValue", pct)
      pct
  ).property("internalValue")

  updateProgress: (->
    @$(".internal").css("width", @get("value") * 100 + "%")
  ).observes("value")

  normalizeValue: (value) ->
    value = 0 if value < 0
    value = 1 if value > 1
    value
