didScroll = false
listeners = []

window.onscroll = ()->
  for listener in listeners
    listener()


###
window.onscroll = ()->
  didScroll = true 

setInterval((()->
  if didScroll
    didScroll = false
    for listener in listeners
      listener()
), 100)
###
module.exports = listeners