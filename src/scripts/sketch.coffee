f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'

config =
  color: (((baseColor,baseOpacity) ->
    base:
      color: baseColor
      opacity: baseOpacity
    point: new N ()->
      "rgba(#{baseColor.get()},#{0.5*baseOpacity.get()})"
    circle: new N ()->
      "rgba(#{baseColor.get()},#{0.1*baseOpacity.get()})"
    line: new N ()->
      (opacity)->
        "rgba(#{baseColor.get()},#{(baseOpacity.get()*opacity).toFixed(2)})"
  )(new N("255,255,255"),new N(0.5)))

f "main-background",
  config:
    resize: true

  setup: (ctx) ->
    config.max =
      width: new N(@anim.getWidth)
      height: new N(@anim.getHeight)

    @system = new ParticleSystem config
    return
  
  update: (time) ->
    @frameEnd = performance.now();
    @updateStart = performance.now();
    @system.update(time)  
    @updateEnd = performance.now();
    return

  draw: (ctx) ->
    @drawStart = performance.now();
    @system.draw(ctx)
    @drawEnd = performance.now();
    update = (@updateEnd - @updateStart).toFixed(2)
    draw = (@drawEnd - @drawStart).toFixed(2)
    frame = (@frameEnd - @frameStart).toFixed(2)
    @frameStart = performance.now();
    console.log("update: #{update}; draw: #{draw}; frame: #{frame};\r")
    # @anim.stop()
    return

module.exports = config