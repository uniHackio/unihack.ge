f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'
onscroller = require('./onscroller')
pixelize = require('./pixelize')
homeContent = document.querySelector('.page-home .centered-wrapper .centered')

['safareli1', 'safareli2', 'safareli3', 'safareli4', 'safareli5', 'safareli6'].forEach(pixelize)

  
f "background-home",
  config:
    resize: true

  setup: (ctx) ->
    config = window.config =
      max:
        width: new N(@anim.getWidth)
        height: new N(@anim.getHeight)

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
            "rgba(#{baseColor.get()},#{baseOpacity.get()*opacity.toFixed(5)/2})"
      )(new N("255,255,255"),new N(1)))
    @system = new ParticleSystem config
    return
  
  update: (time) ->
    @system.update(time)  
    return

  draw: (ctx) ->
    @system.draw(ctx)
    return

  
onscroller.push ()->
  if window.scrollY > homeContent.offsetHeight
    isHomeVisable = false
  else
    isHomeVisable = true
  onHomeVisabilityChange(isHomeVisable)
 
onHomeVisabilityChange = (isHomeVisable)->
  if isHomeVisable
    document.body.classList.add('home-visable')
    window.config.color.base.color.set('255,255,255')
    window.config.color.base.opacity.set(1)
  else
    document.body.classList.remove('home-visable')
    window.config.color.base.color.set('0,0,0')  
    window.config.color.base.opacity.set(0.25)

