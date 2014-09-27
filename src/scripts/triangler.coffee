mask = require('./mask')
TORAD = Math.PI / 180
module.exports = (width, height, amplitude,sides)->
  radius = Math.min(width/2, height/2) - amplitude
  degryRange = 360/sides * TORAD
  startingDegry = Math.random(360)*TORAD
  range = []
  for i in [0...sides]
    x = width/2 + Math.cos(i*degryRange + startingDegry)*radius
    y = height/2 + Math.sin(i*degryRange + startingDegry)*radius
    range.push(mask.interval(x,amplitude))
    range.push(mask.interval(y,amplitude))
  console.log(range)
  api = mask(mask.randomGeometryFromRange(range))
  api.range = range
  return api