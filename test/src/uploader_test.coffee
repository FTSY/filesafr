define ["cs!filesafr/uploader"], (Uploader) ->
  module "Uploader"

  test "initialization add event listeners", ->
    uploader = new Uploader
      oncomplete: -> null
      onprogress: -> null
      other: -> null

    equal uploader.listenersForEvent("complete").length, 1
    equal uploader.listenersForEvent("progress").length, 1
    equal uploader.listenersForEvent("other").length, 0
