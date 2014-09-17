Particle = require './particle'
vec2 = require('gl-matrix').vec2

CACHE = 
  screan: vec2.create()
  center: vec2.create()
  distanceV2: vec2.create()

class ParticleSystem
  constructor: (config)->
    @max = config.max
    @color = config.color
    
    @particles = []
    gap = 50
    velocity = 1
    for i in [0...200]
      @particles.push new Particle
        center:
          x: Math.random() * (@max.width.get() - gap*2) + gap
          y: Math.random() * (@max.height.get() - gap*2) + gap
        velocity:
          x: Math.random() * velocity - velocity/2
          y: Math.random() * velocity - velocity/2
        radius: Math.random() * 60 + 10
        mass: Math.random()*2 + 1
    
    return

  update: (time) ->
    screan = CACHE.screan
    center = CACHE.center
    distanceV2 = CACHE.distanceV2
    vec2.set(screan,@max.width.get(),@max.height.get())
    for point in @particles
      point.edge(screan)
    
    # TODO: seperate atractor staff 
    vec2.set(center,screan[0]/2, screan[1]/2)
    for point in @particles
      vec2.subtract(distanceV2,point.center,center)
      length = vec2.length(distanceV2)
      if length < 150
        vec2.normalize(distanceV2, distanceV2)
        vec2.scale(distanceV2, distanceV2, 150/length * 0.1)
        point.applyForce(distanceV2)

    Particle.checkOverlaps(@particles)
    for point in @particles
      point.update(time)
    return

  draw: (ctx) ->
    ctx.clearRect 0, 0, @max.width.get(), @max.height.get()
    
    pointColor = @color.point.get();
    circleColor = @color.circle.get();
    lineColor = @color.line.get();
    
    for point in @particles
        point.draw(ctx, pointColor, circleColor, lineColor)
    return
module.exports = ParticleSystem