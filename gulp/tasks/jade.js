var gulp = require('gulp')
  , nib = require('nib')
  , cache = require('gulp-cached')
  , progeny = require('gulp-progeny')
  , jade = require('gulp-jade')
  , LOCALS = require('../../src/locals')
  , connect = require('gulp-connect')
  , ignore = require('gulp-ignore');
    

gulp.task('jade', function(){
  return gulp.src('src/docs/**/*.jade')
    .pipe(cache('style'))
    .pipe(progeny())
    .pipe(jade({
      pretty: true,
      locals: LOCALS
    }))
    .pipe(ignore.include('**/index.html'))
    .pipe(ignore.include({isFile:true}))
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());

});