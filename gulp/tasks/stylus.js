var gulp = require('gulp')
  , nib = require('nib')
  , cache = require('gulp-cached')
  , progeny = require('gulp-progeny')
  , plumber = require('gulp-plumber')
  , stylus = require('gulp-stylus')
  , connect = require('gulp-connect')
  , filter = require('gulp-filter');

gulp.task('stylus', function(){
  return gulp.src('src/styles/style.styl')
    .pipe(plumber())
    // .pipe(cache('style'))
    .pipe(progeny())
    .pipe(stylus({
      use: [nib()],
      sourcemap : {
        inline: true,
        sourceRoot: '..',
        basePath: 'css'
      }
    }))
    .pipe(filter(['**.*','!**/_*.css']))
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());

});