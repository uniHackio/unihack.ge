var gulp = require('gulp');
var sftp = require('gulp-sftp');

gulp.task('push', function () {
  return gulp.src('build/*')
    .pipe(sftp({
      host: '***',
      user: '***',
      pass: '***',
      timeout: '***',
      remotePath: '***'
  }));
});