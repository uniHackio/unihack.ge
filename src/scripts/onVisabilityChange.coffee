module.exports = (invocker,elements,eventNameRegex)->
  eventListeners = {}
  visabilities = {}
  elementIsInView = (element) ->
    scrollTop = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop
    scrollHeight = document.body.offsetHeight
    elementTop = element.offsetTop
    elementHeight = element.offsetHeight
    scrollTop > elementTop - scrollHeight and scrollTop < elementTop + elementHeight
  
  for element in elements 
    element.className.replace eventNameRegex, ($0, $1)->
      visabilities[$1] = elementIsInView(element)

  invocker ->
    _visabilities = Object.keys(visabilities).reduce((_visabilities,key)->
      _visabilities[key] = false
      return _visabilities
    ,{})
    for element in elements
      if elementIsInView(element)
        element.className.replace eventNameRegex, ($0, $1)->
          _visabilities[$1] = true
    for name, listeners of eventListeners
      if _visabilities[name] != visabilities[name]
        for listener in listeners
          listener(_visabilities[name])
    visabilities = _visabilities
    return

  return {
    listen: (name,listener)->
      if !eventListeners[name]
        eventListeners[name] = []
      eventListeners[name].push(listener)
      listener(visabilities[name])
      return
  }