f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'

f "home-page-bg",
  config:
    resize: true

  setup: (ctx) ->
    baseColor = new N '255,255,255'
    config = 
      max:
        width: new N @anim.getWidth
        height: new N @anim.getHeight
      color:
        base: baseColor
        point: new N ()->
          "rgb(#{baseColor.get()})"
        circle: new N ()->
          "rgba(#{baseColor.get()},0.1)"
        line: new N ()->
          (opacity)->
            "rgba(#{baseColor.get()},#{opacity.toFixed(5)})"
    @system = new ParticleSystem config
    return
  
  update: (time) ->
    @system.update(time)  
    return

  draw: (ctx) ->
    @system.draw(ctx)
    return