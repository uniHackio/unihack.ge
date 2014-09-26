f = require 'franim'
N = require 'numberer'
ParticleSystem = require './particleSystem'
onscroller = require('./onscroller')
pixelize = require('./pixelize')
locals = require '../locals'
homeContent = document.querySelector('.page-home .centered-wrapper .centered')
eventsPage = document.querySelector('.page-events')
philosophyPage = document.querySelector('.page-philosophy')
teamPage = document.querySelector('.page-team')
sponsorsPage = document.querySelector('.page-sponsors')

onscroller.push ((pages,pageIsInView)->
  ->
    for page in pages
      if pageIsInView(page)
        document.body.classList.add(page.id+'-visable')
      else      
        document.body.classList.remove(page.id+'-visable')

)([eventsPage, philosophyPage, teamPage, sponsorsPage],(page) ->
  scrollTop = document.body.scrollTop
  scrollHeight = document.body.offsetHeight
  pageTop = page.offsetTop
  pageHeight = page.offsetHeight
  scrollTop > pageTop - scrollHeight and scrollTop < pageTop + pageHeight
)
locals.members.forEach (member)->
  console.log(member.id)
  pixelize(member.id)


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
    console.time('update')
    @system.update(time)  
    console.timeEnd('update')
        
    return

  draw: (ctx) ->
    console.time('draw')
    @system.draw(ctx)
    console.timeEnd('draw')
    if window.logTime
      console.timeEnd('f')
      console.time('f')
    # @anim.stop()
    return

  
onscroller.push ((homeIsVisable,onHomeVisabilityChange)->
  ->
    if window.scrollY > homeContent.offsetHeight and homeIsVisable
      onHomeVisabilityChange(homeIsVisable = false)
    else if window.scrollY <= homeContent.offsetHeight and !homeIsVisable
      onHomeVisabilityChange(homeIsVisable = true)
)( true, (homeIsVisable)->
  if homeIsVisable
    document.body.classList.add('home-visable')
    window.config.color.base.color.set('255,255,255')
    window.config.color.base.opacity.set(1)
  else
    document.body.classList.remove('home-visable')
    window.config.color.base.color.set('0,0,0')  
    window.config.color.base.opacity.set(0.25)
)
