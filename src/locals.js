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
  ]),person('safareli2','Irakli Safareli', 'Loard of the Code',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('safareli3','Irakli Safareli', 'Loard of the Code',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('safareli4','Irakli Safareli', 'Loard of the Code',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
  ]),person('safareli5','Irakli Safareli', 'Loard of the Code',imageURL,[
    link('facebook', 'facebook', 'https://www.facebook.com/unihackge'),
    link('twitter', 'twitter', 'https://twitter.com/unihackge'),
    link('google-plus', 'google+', 'https://plus.google.com/107084110225494322165'),
    link('youtube-play', 'youtube', 'https://www.youtube.com/uniHackge'),
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