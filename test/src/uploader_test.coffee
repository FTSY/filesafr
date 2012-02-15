Uploader = FileSafr.Uploader

module "Uploader"

test "initialization add event listeners", ->
  uploader = new Uploader
    oncomplete: -> null
    onprogress: -> null
    other: -> null

  events = Ember.metaPath(uploader, ["listeners"], true)

  ok events.oncomplete
  ok events.onprogress
  ok !events.other
