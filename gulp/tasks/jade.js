var gulp = require('gulp')
  , nib = require('nib')
  , cache = require('gulp-cached')
  , progeny = require('gulp-progeny')
  , plumber = require('gulp-plumber')
  , jade = require('gulp-jade')
  , LOCALS = require('../../src/locals')
  , connect = require('gulp-connect')
  , filter = require('gulp-filter');
    

gulp.task('jade', function(){
  return gulp.src('src/docs/**/*.jade')
    .pipe(plumber())
    .pipe(cache('style'))
    .pipe(progeny())
    .pipe(jade({
      pretty: true,
      locals: LOCALS
    }))
    .pipe(filter(['**index.html']))
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());
    
});