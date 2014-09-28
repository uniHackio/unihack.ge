resize = require('./resize')
polygonGen = require('./polygon')
draw = require('./draw')
cssTemplate = require './profile.cssfy'


module.exports = (id)->
  figure = document.getElementById(id)
  scale = parseFloat(figure.dataset.scale)
  stops = 9
  duration = stops * 6
  amplitude = 20
  image = new Image()
  console.time(id)
  image.onload = ->
    canvas = resize(image, scale, document.createElement('canvas'))
    polygon = polygonGen(canvas.width,canvas.height,amplitude,Math.round(Math.random()*4+3.2))
    clipPathes = []
    for i in [1..stops]
      clipPathes.push({
        stop: ~~((i)*(100/(stops+1)))
        path: polygon()
      })  
    css = cssTemplate({
      id:id
      hoverImage: figure.dataset.source
      normalImage: canvas.toDataURL()
      clipPathesStart: polygon()
      duration: duration
      clipPathes: clipPathes
    })
    # blob = new Blob([css], {type: 'text/css'});
    # link = document.createElement('link');
    # link.rel = 'stylesheet';
    # link.href = window.URL.createObjectURL(blob);
    # document.body.appendChild(link);
    style = document.createElement('style')
    style.appendChild(document.createTextNode(css))
    document.getElementsByTagName('head')[0].appendChild(style)
    console.timeEnd(id)
    return

  image.src = figure.dataset.source
  