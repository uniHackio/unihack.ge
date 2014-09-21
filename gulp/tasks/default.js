var gulp = require('gulp');

gulp.task('default', ['clean'],function(){
  gulp.run(['watch','images']);
});