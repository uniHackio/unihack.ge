module.exports = (gulp, plugins, config)->
  gulp.task 'images', ()->
    return gulp
      .src(config.dir.src.images+"**", base: config.dir.src.base)
      .pipe(gulp.dest(config.dir.build.base))