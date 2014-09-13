f = require 'franim'
n = require 'numberer'
draw = require './draw'
Point = require './point'
vec2 = require('gl-matrix').vec2

f "home-page-bg",
  config:
    resize: true

  clear: (ctx) ->
    ctx.clearRect 0, 0, @width.get(), @height.get()

  setup: (ctx) ->
    @width = new n @anim.getWidth
    @height = new n @anim.getHeight
    @clear(ctx)
    @points = []
    gap = 50
    velocity = 1
    for i in [0...200]
      @points.push new Point
        center:
          x: Math.random() * (@width.get() - gap*2) + gap
          y: Math.random() * (@height.get() - gap*2) + gap
        velocity:
          x: Math.random() * velocity - velocity/2
          y: Math.random() * velocity - velocity/2
        radius: Math.random() * 60 + 10
    return
  cache:
    screan: vec2.create()
    center: vec2.create()
    distanceV2: vec2.create()
  update: (time) ->
    screan = @cache.screan
    center = @cache.center
    distanceV2 = @cache.distanceV2
    vec2.set(screan,@width.get(),@height.get())
    for point in @points
      point.edge(screan)
    
    vec2.set(center,screan[0]/2, screan[1]/2)
    for point in @points
      vec2.subtract(distanceV2,point.center,center)
      length = vec2.length(distanceV2)
      if length < 150
        vec2.normalize(distanceV2, distanceV2)
        vec2.scale(distanceV2, distanceV2, 150/length * 0.1)
        point.applyForce(distanceV2)

    Point.checkOverlaps(@points)
    for point in @points
      point.update(time)
    return

  draw: (ctx) ->
    @clear(ctx)
    for point in @points
      point.draw(ctx)
    # @anim.pause();
    return