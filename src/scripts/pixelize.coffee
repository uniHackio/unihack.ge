resize = require('./resize')
polygonGen = require('./polygon')
draw = require('./draw')
cssTemplate = require './profile.cssfy'


module.exports = (id)->
  figure = document.getElementById(id)
  scale = parseFloat(figure.dataset.scale)
  image = new Image()
  image.onload = ->
    canvas = resize(image, scale, document.createElement('canvas'))
    polygon = polygonGen(canvas.width,canvas.height,20,Math.round(Math.random()*4)+3)
    stops = 7
    clipPathes = []
    for i in [1..stops]
      clipPathes.push({
        stop: ~~((i)*(100/(stops+1)))
        path: polygon.generate()
      })  
    css = cssTemplate({
      id:id
      hoverImage:figure.dataset.source
      normalImage:canvas.toDataURL()
      clipPathesStart:polygon.generate()
      duration: stops*6
      clipPathes:clipPathes
    })
    style = document.createElement('style')
    style.appendChild(document.createTextNode(css))
    document.getElementsByTagName('head')[0].appendChild(style)
    return

  image.src = figure.dataset.source
  