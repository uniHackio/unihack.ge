range = (base, length)->
  return base + Math.random()*2*length - length
module.exports = (width, height, amplitude)->
  t = [
    range(width/2, amplitude), range(amplitude, amplitude), 
    range(width - amplitude, amplitude), range(height - amplitude, amplitude), 
    range(amplitude, amplitude), range(height - amplitude, amplitude)
  ] 
  return (ctx)->
    ctx.save()
    ctx.globalCompositeOperation = 'destination-in'
    ctx.beginPath()
    ctx.moveTo(t[0], t[1]);
    ctx.lineTo(t[2], t[3]);
    ctx.lineTo(t[4], t[5]);
    ctx.fill()
    ctx.restore()
    return t
