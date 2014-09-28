f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'
onscroller = require('./onscroller')
pixelize = require('./pixelize')
locals = require '../locals'
homeContent = document.querySelector('.page-home .centered-wrapper .centered')
elements = document.getElementsByClassName('page')
onVisabilityChangeListener = require('./onVisabilityChange')(
  onscroller.push.bind(onscroller),
  elements,
  /page-([a-zA-Z0-9\-]+)/g
)

onActiveElementChangeListener = require('./onActiveElementChange')(
  onscroller.push.bind(onscroller),
  elements
)

onActiveElementChangeListener.listen (elementId)->  
  document.body.className = document.body.className.replace(/active-([a-zA-Z0-9\-]+)/g,'')
  document.body.classList.add("active-#{elementId}")
  return

locals.members.forEach (member)->
  console.log(member.id)
  pixelize.add(member.id)
pixelize.run()

f "main-background",
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
            "rgba(#{baseColor.get()},#{(baseOpacity.get()*opacity).toFixed(2)})"
      )(new N("255,255,255"),new N(0.5)))
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

addVisabilityClassToElement = (page)->
  element = document.body
  return (isVisable)->
    if isVisable
      element.classList.add("#{page}-visable")
    else
      element.classList.remove("#{page}-visable")  

onVisabilityChangeListener.listen 'home', addVisabilityClassToElement('home')
onVisabilityChangeListener.listen 'home', (homeIsVisable)->
  if homeIsVisable
    window.config.color.base.color.set('255,255,255')
    window.config.color.base.opacity.set(1)
  else
    window.config.color.base.color.set('0,0,0')  
    window.config.color.base.opacity.set(0.25)

onVisabilityChangeListener.listen 'events', addVisabilityClassToElement('events')
onVisabilityChangeListener.listen 'philosophy', addVisabilityClassToElement('philosophy')
onVisabilityChangeListener.listen 'team', addVisabilityClassToElement('team')
onVisabilityChangeListener.listen 'sponsors', addVisabilityClassToElement('sponsors')
