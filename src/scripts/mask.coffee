enshureGeometryisValid = (geometry)->
  if geometry.length < 6 || geometry.length%2 != 0
    throw new Exeption('invalid geometry length') 

mask = (geometry)->
  return {
    geometry:geometry,
    mask:(ctx)->
      enshureGeometryisValid(@geometry);
      ctx.save()
      ctx.globalCompositeOperation = 'destination-in'
      ctx.beginPath()
      ctx.moveTo(@geometry[0], @geometry[1]);
      for i in [2..@geometry.length] by 2
        ctx.lineTo(@geometry[i], @geometry[i+1]);
      ctx.fill()
      ctx.restore()
      return
  }

mask.randomGeometryFromRange = (range)->
  return range.map (interval)->
    length = interval[1] - interval[0]
    return Math.random() * length + interval[0]

mask.interval = (center,amplitude)->
  return [center - amplitude, center + amplitude]

module.exports = mask