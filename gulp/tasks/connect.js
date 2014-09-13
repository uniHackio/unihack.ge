var connect = require('gulp-connect')
  , gulp    = require('gulp');

gulp.task('connect', function() {
  connect.server({
    root: 'build',
    livereload: true
  });
});