module "Observable mixin"

class SampleClass
  mix @::, FileSafr.Observable

test "adding listener and dispatching an event", ->
  spy = this.spy()

  obj = new SampleClass()
  obj.addListener "foo", spy
  obj.triggerEvent("foo", 3)

  ok(spy.calledWith(3), "event was dispatched")
