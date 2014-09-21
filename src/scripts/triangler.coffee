mask = require('./mask')
module.exports = (width, height, amplitude)->
  range = [
    mask.interval(width/2, amplitude),#1x
    mask.interval(amplitude, amplitude), #1y
    mask.interval(width - amplitude, amplitude),#2x
    mask.interval(height - amplitude, amplitude), #2y
    mask.interval(amplitude, amplitude),#3x
    mask.interval(height - amplitude, amplitude)#3y
  ]
  api = mask(mask.randomGeometryFromRange(range))
  api.range = range
  return api