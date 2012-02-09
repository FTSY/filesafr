window.FileSafr.UI.ProgressBar = Ember.View.extend
  tagName: "div"
  template: Ember.Handlebars.compile('<div class="internal"></div>')
  classNames: ["progress-bar"]
  internalValue: 0
  animated: true

  value: ((key, value) ->
    if arguments.length == 1
      @get("internalValue")
    else
      pct = @normalizeValue(value)
      @set("internalValue", pct)
      pct
  ).property("internalValue")

  updateProgress: (->
    move = width: @get("value") * 100 + "%"
    element = @$(".internal")

    if @get("animated")
      element.animate(move, 400)
    else
      element.css(move)
  ).observes("value")

  normalizeValue: (value) ->
    value = 0 if value < 0
    value = 1 if value > 1
    value
