f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'

f "background-home",
  config:
    resize: true

  setup: (ctx) ->
    config =
      max:
        width: new N(@anim.getWidth)
        height: new N(@anim.getHeight)

      color: (((baseColor) ->
        base: baseColor
        point: new N ()->
          "rgba(#{baseColor.get()},0.5)"
        circle: new N ()->
          "rgba(#{baseColor.get()},0.1)"
        line: new N ()->
          (opacity)->
            "rgba(#{baseColor.get()},#{opacity.toFixed(5)/2})"
      )(new N("255,255,255")))
    @system = new ParticleSystem config
    return
  
  update: (time) ->
    @system.update(time)  
    return

  draw: (ctx) ->
    @system.draw(ctx)
    return