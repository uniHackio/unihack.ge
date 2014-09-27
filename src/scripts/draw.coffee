drawLineCallsByColor = {};
drawLines = (ctx,points,color)->
  ctx.save()
  ctx.beginPath()
  items = 2
  i = 0 
  l = points.length/items
  start = undefined
  end = undefined 
  while i < l
    start = points[i*items]
    end = points[i*items + 1]
    ctx.moveTo start[0],start[1]
    ctx.lineTo end[0],end[1]
    i++
  ctx.strokeStyle = color
  ctx.stroke()
  ctx.closePath()
  ctx.restore()
    
draw = 
  clearLineCache:(ctx)->
    for color, points of drawLineCallsByColor
      drawLines(ctx,points,color)
    drawLineCallsByColor = {}
    
  line: (start,end,color) ->
    if !drawLineCallsByColor[color]
      drawLineCallsByColor[color] = []
    drawLineCallsByColor[color].push(start)
    drawLineCallsByColor[color].push(end)
    return
    
  circle: (ctx,center,radius,color) ->
    ctx.save()
    ctx.beginPath()
    ctx.arc center[0], center[1], radius, 0, 2 * Math.PI, false
    ctx.fillStyle = (color or "blue")
    ctx.fill()
    # ctx.closePath()
    ctx.restore()
    return
  loop:(f)->
    isRunning = true
    animationCallback = (time)->
      f(time)
      if isRunning == false
        window.cancelAnimationFrame(requestId)
        requestId = 0
      else
        window.requestAnimationFrame(animationCallback)    
    
    window.requestAnimationFrame(animationCallback);
    return {
      toggle:->
        isRunning = !isRunning;
    }

module.exports = draw;