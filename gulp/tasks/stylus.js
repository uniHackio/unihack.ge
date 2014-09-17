var gulp = require('gulp')
  , nib = require('nib')
  , cache = require('gulp-cached')
  , progeny = require('gulp-progeny')
  , stylus = require('gulp-stylus')
  , connect = require('gulp-connect')
  , ignore = require('gulp-ignore');

gulp.task('stylus', function(){
  return gulp.src('src/styles/**')
    .pipe(cache('style'))
    .pipe(progeny())
    .pipe(stylus({
      use: [nib()],
      sourcemap : {
        inline: true,
        sourceRoot: '..',
        basePath: 'css'
      }
    }))
    .pipe(ignore.exclude('**/_*.css'))
    .pipe(ignore.include({isFile:true}))
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());

});