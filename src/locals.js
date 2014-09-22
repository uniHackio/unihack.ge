function args2Obj () {
  var keys = Array.prototype.slice.apply(arguments);
  return function () {
    var values = Array.prototype.slice.apply(arguments);
    return keys.reduce(function (result,key,index) {
      result[key] = values[index];
      return result;
    },{});
  };
};

var person = args2Obj('id','name','position','image','links');
var link = args2Obj('icon', 'on', 'href');
var members = [
  person('gtkesh','Giorgi Tkeshelashvili', 'Georgia Tech','',[
    link('facebook', 'facebook', 'https://www.facebook.com/gtkesh'),
    link('twitter', 'twitter', 'https://twitter.com/gtkesh'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+GiorgiTkeshelashvili'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('safareli','Irakli Safareli', 'Lord of the Code','/images/safareli.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/sapa8'),
    link('twitter', 'twitter', 'https://twitter.com/safareli'),
    link('google-plus', 'google+', 'https://google.com/+IrakliSafareli'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/isafareli'),
  ]),person('revazi','Revaz Zakalashvili', '','/images/revazi.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/rzakala'),
    link('google-plus', 'google+', 'https://plus.google.com/+RevazZakalashvili-zakala/'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('stichoza','Levan Velijanashvili', 'UNIX Junkie', '/images/stichoza.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/stichoza'),
    link('twitter', 'twitter', 'https://twitter.com/Stichoza'),
    link('google-plus', 'google+', 'https://plus.google.com/101847100678903848318'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/stichoza'),
  ]),person('zero','Luka Ramishvili', 'metahacker','/images/zero.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/lukaramishvili'),
    link('twitter', 'twitter', 'https://twitter.com/lukaramishvili'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/lukaramishvili'),
  ]),person('demonno','Demur Nodia', 'TODO','__',[
    link('facebook', 'facebook', 'https://www.facebook.com/demuri.nodia'),
    link('twitter', 'twitter', 'https://twitter.com/demurnodia'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+DemurNodia'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/demurnodia'),
  ]),person('tebex','Giorgi Tabidze', 'TODO','/images/safareli.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('otarza','Otar Zakalashvili', 'Technology Agnostic','https://www.dropbox.com/s/ja0o4mchc98lqy8/otar270.jpeg',[
    link('facebook', 'facebook', 'https://www.facebook.com/otarza'),
    link('twitter', 'twitter', 'https://twitter.com/otarza'),
    link('linkedin', 'linkedin', 'www.linkedin.com/pub/otar-zakalashvili/15/3a8/547/'),
    link('google-plus', 'google+', 'https://plus.google.com/109734750145229671001'),
  ]),
];
module.exports = {
  members: members
};
