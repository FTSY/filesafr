define
  addListener: (event, listener) ->
    @_ensureListenerScope(event)
    @_eventListeners[event].push(listener)

    this

  listenersForEvent: (event) ->
    @_ensureListenerScope(event)
    @_eventListeners[event]

  triggerEvent: (event, args...) ->
    listener.apply(this, args) for listener in @listenersForEvent(event)

    this

  _ensureListenerScope: (event) ->
    @_eventListeners ?= {}
    @_eventListeners[event] ?= []

    this
