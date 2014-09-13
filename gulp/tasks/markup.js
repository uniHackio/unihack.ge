var gulp = require('gulp')
  , connect = require('gulp-connect');

gulp.task('markup', function() {
  return gulp.src('src/htdocs/**')
    .pipe(gulp.dest('build'))
    .pipe(connect.reload());
});