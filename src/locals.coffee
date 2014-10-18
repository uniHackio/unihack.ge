args2Obj = ->
  keys = Array::slice.apply(arguments)
  ->
    values = Array::slice.apply(arguments)
    keys.reduce ((result, key, index) ->
      result[key] = values[index]
      result
    ), {}
person = args2Obj("id", "name", "position", "image", "links")
link = args2Obj("icon", "on", "href")
members = [
  person("gtkesh", "Giorgi Tkeshelashvili", "Georgia Tech", "/images/gtkesh.jpg", [
    link("facebook", "facebook", "https://www.facebook.com/gtkesh")
    link("twitter", "twitter", "https://twitter.com/gtkesh")
    link("google-plus", "google+", "https://plus.google.com/u/0/+GiorgiTkeshelashvili")
    link("github", "github", "https://github.com/gtkesh")
  ])
  person("safareli", "Irakli Safareli", "Lord of the Code", "/images/safareli.jpg", [
    link("twitter", "twitter", "https://twitter.com/safareli")
    link("google-plus", "google+", "https://google.com/+IrakliSafareli")
    link("youtube-play", "youtube", "https://www.youtube.com/isafareli")
    link("linkedin", "linkedin", "https://www.linkedin.com/in/safareli")
    link("github", "github", "https://github.com/safareli")
  ])
  person("revazi", "Revaz Zakalashvili", "Code Lover", "/images/revazi.jpg", [
    link("facebook", "facebook", "https://www.facebook.com/unihackge")
    link("twitter", "twitter", "https://twitter.com/rzakala")
    link("google-plus", "google+", "https://plus.google.com/+RevazZakalashvili-zakala/")
    link("youtube-play", "youtube", "https://www.youtube.com/uniHackge")
  ])
  person("stichoza", "Levan Velijanashvili", "UNIX Junkie", "/images/stichoza.jpg", [
    link("external-link", "website", "https://stichoza.com/")
    link("github", "github", "https://github.com/Stichoza")
    link("twitter", "twitter", "https://twitter.com/Stichoza")
    link("facebook", "facebook", "https://facebook.com/Stichoza")
    link("linkedin", "linkedin", "http://www.linkedin.com/in/stichoza")
  ])
  person("zero", "Luka Ramishvili", "metahacker", "/images/zero.jpg", [
    link("facebook", "facebook", "https://www.facebook.com/lukaramishvili")
    link("twitter", "twitter", "https://twitter.com/lukaramishvili")
    link("youtube-play", "youtube", "https://www.youtube.com/lukaramishvili")
  ])
  person("demonno", "Demur Nodia", "", "/images/demonno.jpg", [
    link("facebook", "facebook", "https://www.facebook.com/demuri.nodia")
    link("twitter", "twitter", "https://twitter.com/demurnodia")
    link("google-plus", "google+", "https://plus.google.com/u/0/+DemurNodia")
    link("youtube-play", "youtube", "https://www.youtube.com/demurnodia")
  ])
  person("tebex", "Giorgi Tabidze", "User-Friendly", "/images/tabex.jpg", [
    link("twitter", "twitter", "https://twitter.com/gtabidze")
    link("facebook", "facebook", "https://fb.com/gmline")
    link("behance", "behance", "https://be.net/gtabidze")
  ])
  person("otarza", "Otar Zakalashvili", "Technology Agnostic", "/images/otarza.jpeg", [
    link("facebook", "facebook", "https://www.facebook.com/otarza")
    link("twitter", "twitter", "https://twitter.com/otarza")
    link("linkedin", "linkedin", "https://www.linkedin.com/pub/otar-zakalashvili/15/3a8/547/")
    link("google-plus", "google+", "https://plus.google.com/109734750145229671001")
  ])
]
module.exports = 
  data:
    members: members
  defaultLanguageKey: 'ka'
  locals:
    ka:
      'META_SITE_URL': 'http://unihack.ge'
      'META_TITLE': 'uniHack'
      'META_SITE_NAME': 'uniHack.ge'
      'META_DESCRIPTION': "Let's build things that matter. Together.",
      'languagePrefix': ''
      'რა გაგვიკეთებია აქამდე': 'რა გაგვიკეთებია აქამდე'
      'ჩვენი ხედვა': 'ჩვენი ხედვა'
      'ყველაზე გუნდი': 'ყველაზე გუნდი'
      'სპონსორები': 'სპონსორები'
      'web page of %s': '%s-ის ვებგვერდი'
      'უნიჰაკის დაბადება': 'უნიჰაკის დაბადება'
      "Let's build things that matter. Together.": "Let's build things that matter. Together."
      'Events': 'Events'
      'uniHackge on %s': 'uniHackge %s-ზე'
    en:
      'languagePrefix': 'en/'
      'Past Events': 'Past Events'
      'Our Vision': 'Our Vision'
      'Team': 'Team'
      'Sponsors': 'Sponsors'
      'web page of %s': 'w..eb .pa.ge. o.f %s'
      'UniHack Was Born': 'UniHack Was Born'
      "Let's build things that matter. Together.": "Let's build things that matter. Together."
      'Events': 'Events'
      'uniHackge on %s': 'un.i.H.a.ck...ge on %s'
