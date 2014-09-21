resize = require('./resize')
triangler = require('./triangler')

module.exports = (id)->
  canvas = document.getElementById(id)
  minScale = parseFloat(canvas.dataset.scale)
  isOut = true
  animationInterval = null
  scale = minScale
  rescale = (scale)->
    return
  canvas.parentNode.onmouseover = ()-> 
    if isOut
      isOut = false
      animationInterval = setInterval (->
        if isOut
          clearInterval(animationInterval)
          return
        if scale >= 0.9
          scale = 0.9
          clearInterval(animationInterval)
        else
          scale +=Math.sqrt(scale)/2
        rescale(scale)
        return
      ), 1000/60
      
  # todo use jquery for events
  # todo use for interval
  # http://www.bennadel.com/blog/1856-using-jquery-s-animate-step-callback-function-to-create-custom-animations.htm
  canvas.parentNode.onmouseout = ()-> 
    isOut = true
    scale = minScale
    rescale(scale)

  image = new Image()
  image.onload = ->
    triangle = triangler(@width,@height,20)
    ctx = canvas.getContext("2d")
    rescale = (s)->
      resize(image, s, canvas)
      triangle(ctx)
    rescale(minScale)
    return

  image.src = canvas.dataset.source
  