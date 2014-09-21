var gulp = require('gulp');

gulp.task('images', function () {  
    return gulp.src('src/images/**',{base: 'src'})
      .pipe(gulp.dest('build'))
});