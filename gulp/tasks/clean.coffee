module.exports = (gulp, plugins, config)->
  gulp.task 'clean', ()->
    return gulp
      .src(config.dir.build.base, read: false)
      .pipe(plugins.clean())