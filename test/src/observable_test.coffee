define ["cs!filesafr/core", "cs!filesafr/observable"], (h, Observable) ->
  module "Observable mixin"

  class SampleClass
    h.mix @::, Observable

  test "adding listener and dispatching an event", ->
    spy = this.spy()

    obj = new SampleClass()
    obj.addListener "foo", spy
    obj.triggerEvent("foo", 3)

    ok(spy.calledWith(3), "event was dispatched")
