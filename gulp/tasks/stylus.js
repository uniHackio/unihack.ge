var gulp = require('gulp')
  , nib = require('nib')
  , cache = require('gulp-cached')
  , progeny = require('gulp-progeny')
  , plumber = require('gulp-plumber')
  , stylus = require('gulp-stylus')
  , connect = require('gulp-connect')
  , gutil = require('gulp-util')
  , debug = gutil.env.type !== 'production'
  , filter = require('gulp-filter');

gulp.task('stylus', function(){
  sourcemap = debug ? {
    inline: true,
    sourceRoot: '..',
    basePath: 'css'
  }: false;
  return gulp.src('src/styles/style.styl')
    .pipe(plumber())
    // .pipe(cache('style'))
    .pipe(progeny())
    .pipe(stylus({
      use: [nib()],
      compress: !debug,
      sourcemap : sourcemap
    }))
    .pipe(filter(['**.*','!**/_*.css']))
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());

});