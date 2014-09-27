listeners = module.exports = []
window.onscroll = ()->
  for listener in listeners
    listener()