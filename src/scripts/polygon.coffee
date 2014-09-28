TORAD = Math.PI / 180

interval = (center,amplitude)->
  return [center - amplitude, center + amplitude]

randomFromInterval = (interval)->
  length = interval[1] - interval[0]
  return Math.random() * length + interval[0]

generate = (pointRanges)->
  return pointRanges.map((PointInterval)->
    return [
      randomFromInterval(PointInterval.x),
      randomFromInterval(PointInterval.y)
    ]
  )

module.exports = (width, height, amplitude,sides)->
  radius = Math.min(width/2, height/2) - amplitude
  degryRange = 360/sides * TORAD
  startingDegry = Math.random(360)*TORAD
  pointRanges = []
  for i in [0...sides]
    x = width/2 + Math.cos(i*degryRange + startingDegry)*radius
    y = height/2 + Math.sin(i*degryRange + startingDegry)*radius
    pointRanges.push({
      x:interval(x,amplitude),
      y:interval(y,amplitude)
    })
  console.log(pointRanges)
  
  return ->
    points = generate(pointRanges)
    return points.map((point)->
      return "#{point[0].toFixed(2)}px #{point[1].toFixed(2)}px"
    ).join(',')