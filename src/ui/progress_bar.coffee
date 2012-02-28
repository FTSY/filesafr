define ["ember"], (E) ->
  E.View.extend
    tagName: "progress"
    max: 1
    attributeBindings: ["value", "max"]
