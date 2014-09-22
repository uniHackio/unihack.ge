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
// var imageURL = 'https://avatars1.githubusercontent.com/u/1932383?v=2&s=270';
var imageURL = '/images/safareli.jpg';
var members = [
  person('gtkesh','Giorgi Tkeshelashvili', 'Georgia Tech',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/gtkesh'),
    link('twitter', 'twitter', 'https://twitter.com/gtkesh'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+GiorgiTkeshelashvili'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('Zakala','Revaz Zakalashvili', '','http://www.gravatar.com/avatar/aead2ed56ad0638d911f23a39e1f11cd.png?size=256',[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/rzakala'),
    link('google-plus', 'google+', 'https://plus.google.com/+RevazZakalashvili-zakala/'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('stichoza','Levan Velijanashvili', 'UNIX Junkie', 'http://www.gravatar.com/avatar/a4b21b6e5e8b2ee0512e7130aa95aea3.png?size=256',[
    link('facebook', 'facebook', 'https://www.facebook.com/stichoza'),
    link('twitter', 'twitter', 'https://twitter.com/Stichoza'),
    link('google-plus', 'google+', 'https://plus.google.com/101847100678903848318'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/stichoza'),
  ]),person('zero','Luka Ramishvili', 'metahacker','http://luka.ge/zero-avatar.jpg',[
    link('facebook', 'facebook', 'https://www.facebook.com/lukaramishvili'),
    link('twitter', 'twitter', 'https://twitter.com/lukaramishvili'),
    link('google-plus', 'google+', ''),
    link('youtube-play', 'youtube', 'https://www.youtube.com/lukaramishvili'),
  ]),person('demonno','Demur Nodia', '',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/demuri.nodia'),
    link('twitter', 'twitter', 'https://twitter.com/demurnodia'),
    link('google-plus', 'google+', 'https://plus.google.com/u/0/+DemurNodia'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/demurnodia'),
  ]),person('safareli6','Irakli Safareli', 'Loard of the Code',imageURL,[
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
