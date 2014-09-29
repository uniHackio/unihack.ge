onscroller = require './onscroller'
pixelize = require './pixelize'
sketch = require './sketch'
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
    sketch.color.base.color.set('255,255,255')
    sketch.color.base.opacity.set(1)
  else
    sketch.color.base.color.set('0,0,0')  
    sketch.color.base.opacity.set(0.25)

onVisabilityChangeListener.listen 'events', addVisabilityClassToElement('events')
onVisabilityChangeListener.listen 'philosophy', addVisabilityClassToElement('philosophy')
onVisabilityChangeListener.listen 'team', addVisabilityClassToElement('team')
onVisabilityChangeListener.listen 'sponsors', addVisabilityClassToElement('sponsors')


$ ->
  $("a[href*=#]:not([href=#])").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 1000
        false

  return


((i, s, o, g, r, a, m) ->
  i["GoogleAnalyticsObject"] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date()
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
  return
) window, document, "script", "//www.google-analytics.com/analytics.js", "ga"
ga "create", "UA-45966899-1", "auto"
ga "send", "pageview"