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
  person('safareli1','Irakli Safareli', 'Loard of the Code',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('Zakala','Revaz Zakalashvili', '','http://www.gravatar.com/avatar/aead2ed56ad0638d911f23a39e1f11cd.png',[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/rzakala'),
    link('google-plus', 'google+', 'https://plus.google.com/+RevazZakalashvili-zakala/'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('stichoza','Levan Velijanashvili', '', imageURL,[
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
  ]),
];
module.exports = {
  members: members
};
