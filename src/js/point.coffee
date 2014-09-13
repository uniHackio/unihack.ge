vec2 = require('gl-matrix').vec2
N = require 'numberer'
draw = require './draw'
class Point
  constructor: (obj) ->
    @center = vec2.fromValues obj.center.x, obj.center.y
    @acceleration = vec2.fromValues 0, 0
    @velocity = vec2.fromValues obj.velocity.x, obj.velocity.y
    @radius = new N(obj.radius)

    @mass = 1 # @radius.get() * @radius.get() * 2 *Math.PI
    @drawLines = []
 
  applyForce: (force) ->
    vec2.scale force, force, 1/@mass  
    vec2.add @acceleration, @acceleration, force

  stop: ->
    vec2.set @acceleration, 0 , 0
    vec2.set @velocity, 0 , 0
 
  checkOverlap: (points,from,to) ->
    distance = vec2.create()
    for i in [from..to]
      point = points[i]
      vec2.subtract(distance, @center, point.center)
      currentDistance = vec2.length(distance)
      drawDistance = point.radius.get() + @radius.get()
      continue if currentDistance > drawDistance

      opacity = currentDistance / drawDistance
      opacity = 1 - opacity
      @drawLines.push([point.center,@center,opacity])
    return
 
  edge: (max) ->
    if @center[0] < 0  and @velocity[0] < 0
      @velocity[0] *= -1
    if @center[0] > max[0] and @velocity[0] > 0
      @velocity[0] *= -1
    if @center[1] < 0  and @velocity[1] < 0
      @velocity[1] *= -1
    if @center[1] > max[1] and @velocity[1] > 0
      @velocity[1] *= -1

  update: (time) ->
    maxVelocity = 0.5
    vec2.add(@velocity, @velocity, @acceleration)
    length = vec2.length(@velocity)
    vec2.scale(@velocity, @velocity, maxVelocity/length ) if length > maxVelocity 
    vec2.add(@center, @center, @velocity)
    vec2.set @acceleration, 0 , 0
    return

  drawPoint: (ctx) ->
    ctx.beginPath()
    ctx.arc @center[0], @center[1], 0.1, 0, 2 * Math.PI, false
    ctx.lineWidth = 0.5
    ctx.strokeStyle = 'rgb(255,255,255)'
    ctx.stroke()
    if window.drawCircle
      ctx.beginPath()
      ctx.arc @center[0], @center[1], @radius.get(), 0, 2 * Math.PI, false
      ctx.lineWidth = 1
      ctx.strokeStyle = 'rgba(255,255,255,0.1)'
      ctx.stroke()

  draw: (ctx) ->
    @drawPoint(ctx)
    
    for line in @drawLines
      line[2] = "rgba(255,255,255,#{line[2]})"
      draw.line.apply(ctx,line)
    @drawLines = []

    return

Point.checkOverlaps = (points) ->
  length = points.length - 1 
  for i in [0..length]
    points[i].checkOverlap(points,i,length)
  return

module.exports = Point