draw = 
  line: (ctx,start,end,color) ->
    ctx.save()
    ctx.beginPath()
    ctx.moveTo start[0],start[1]
    ctx.lineTo end[0],end[1]
    ctx.strokeStyle = (color or "blue")
    ctx.stroke()
    ctx.closePath()
    ctx.restore()
    return
    
  circle: (ctx,center,radius,color) ->
    ctx.save()
    ctx.beginPath()
    ctx.arc center[0], center[1], radius, 0, 2 * Math.PI, false
    ctx.fillStyle = (color or "blue")
    ctx.fill()
    ctx.closePath()
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