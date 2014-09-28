resize = require('./resize')
polygonGen = require('./polygon')
draw = require('./draw')
cssTemplate = require './profile.cssfy'
ids = null
canvas = null
runner = (id,onEnd)->
  figure = document.getElementById(id)
  scale = parseFloat(figure.dataset.scale)
  stops = 9
  duration = stops * 6
  amplitude = 20
  image = new Image()
  console.time(id)
  image.onload = ->
    resize(image, scale, canvas)
    polygon = polygonGen(canvas.width,canvas.height,amplitude,Math.round(Math.random()*4+3.2))
    clipPathes = []
    for i in [1..stops]
      clipPathes.push({
        stop: ~~((i)*(100/(stops+1)))
        path: polygon()
      })  
    css = cssTemplate({
      delay:(Math.random()*0.5 + 0.3).toFixed(2)
      id:id
      hoverImage: figure.dataset.source
      normalImage: canvas.toDataURL()
      clipPathesStart: polygon()
      duration: duration
      clipPathes: clipPathes
    })
    figure.classList.add('loaded')
    console.timeEnd(id)
    onEnd(css)

  image.src = figure.dataset.source


module.exports = {
  add:(id)->
    if !ids
      ids = []
      canvas = document.createElement('canvas')
    ids.push(id)    
  run:((cssStore)->
    run = (css)->
      if css
        cssStore += "\n#{css}"
      if ids.length == 0
        style = document.createElement('style')
        style.appendChild(document.createTextNode(cssStore))
        document.getElementsByTagName('head')[0].appendChild(style)
        cssStore = null
        ids = null
        canvas = null
        return
      setTimeout(runner.bind(undefined, ids.shift() ,run),20)
      return
  )('/*generated CSS*/')
}