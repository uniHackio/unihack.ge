resize = require('./resize')
triangler = require('./triangler')
draw = require('./draw')
module.exports = (id)->
  canvas = document.getElementById(id)
  minScale = parseFloat(canvas.dataset.scale)
  requestId = null
  triangle = null
  rescale = null
  scale = minScale
  $(canvas).parent().hover (->
    scale = 0.9
  ), ->
    scale = 0.1


  image = new Image()
  image.onload = ->
    triangle = triangler(@width,@height,20)
    ctx = canvas.getContext("2d")
    v = [
      Math.random() - 0.5,
      Math.random() - 0.5,
      Math.random() - 0.5,
      Math.random() - 0.5,
      Math.random() - 0.5,
      Math.random() - 0.5,
    ]
    rescale = (->
      cache = {}
      return (s)->
        key = s.toFixed(2)
        if cache[key] == undefined
          cache[key] = resize(image, s, canvas);
        else
          ctx.putImageData(cache[key],0,0)
        triangle.mask(ctx)
    )()
    rescale(minScale) 
    looper = draw.loop (time)->
      triangle.geometry = triangle.geometry.map (point,i)->
        interval = triangle.range[i]
        if point+v[i] <=interval[0] || point+v[i] >= interval[1]
          v[i]*=-1
        return point + v[i]
      rescale(scale)
    return

  image.src = canvas.dataset.source
  