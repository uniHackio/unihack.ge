module.exports = (invocker,elements)->
  listeners = []
  getActiveElementId = ()->
    return (Array.prototype.slice.call(elements).sort (a,b)->
      scrollTop = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop
      aTop = scrollTop - a.offsetTop
      bTop = scrollTop - b.offsetTop
      return !((aTop < 0 || bTop < 0) ? aTop > bTop : aTop < bTop)
    ).shift().id
  activeElementId = getActiveElementId()
  invocker ->
    _activeElementId = getActiveElementId()
    if activeElementId != _activeElementId 
      for listener in listeners
        listener(_activeElementId)
    activeElementId = _activeElementId
  return {
    listen: (listener)->
      listeners.push(listener)
      listener(activeElementId)
      return
  }