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
  person('gtkesh','Giorgi Tkeshelashvili', 'Georgia Tech','/images/gtkesh.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/gtkesh'),
    link('twitter', 'twitter', 'https://twitter.com/gtkesh'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+GiorgiTkeshelashvili'),
    link('github', 'github', 'https://github.com/gtkesh'),
  ]),person('safareli','Irakli Safareli', 'Lord of the Code','/images/safareli.jpg',[
    link('twitter', 'twitter', 'https://twitter.com/safareli'),
    link('google-plus', 'google+', 'https://google.com/+IrakliSafareli'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/isafareli'),
    link('linkedin', 'linkedin', 'https://www.linkedin.com/in/safareli'),
    link('github', 'github', 'https://github.com/safareli'),
  ]),person('revazi','Revaz Zakalashvili', '','/images/revazi.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/rzakala'),
    link('google-plus', 'google+', 'https://plus.google.com/+RevazZakalashvili-zakala/'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('stichoza','Levan Velijanashvili', 'UNIX Junkie', '/images/stichoza.png',[
    link('external-link-square','website', 'https://stichoza.com/'),
    link('github-square',       'github',  'https://github.com/Stichoza'),
    link('twitter-square',      'twitter', 'https://twitter.com/Stichoza'),
    link('facebook-square',     'facebook','https://facebook.com/Stichoza'),
    link('linkedin-square',     'linkedin','http://www.linkedin.com/in/stichoza'),
  ]),person('zero','Luka Ramishvili', 'metahacker','/images/zero.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/lukaramishvili'),
    link('twitter', 'twitter', 'https://twitter.com/lukaramishvili'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/lukaramishvili'),
  ]),person('demonno','Demur Nodia', '','/images/demonno.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/demuri.nodia'),
    link('twitter', 'twitter', 'https://twitter.com/demurnodia'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+DemurNodia'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/demurnodia'),
  ]),person('tebex','Giorgi Tabidze', 'User-Friendly','/images/tabex.jpg',[ 
    link('twitter', 'twitter', 'https://twitter.com/gtabidze'),
    link('facebook', 'facebook', 'https://fb.com/gmline'),
    link('behance', 'behance', 'https://be.net/gtabidze'),
  ]),person('otarza','Otar Zakalashvili', 'Technology Agnostic','/images/otarza.jpeg',[
    link('facebook', 'facebook', 'https://www.facebook.com/otarza'),
    link('twitter', 'twitter', 'https://twitter.com/otarza'),
    link('linkedin', 'linkedin', 'https://www.linkedin.com/pub/otar-zakalashvili/15/3a8/547/'),
    link('google-plus', 'google+', 'https://plus.google.com/109734750145229671001'),
  ]),
];
module.exports = {
  members: members
};
