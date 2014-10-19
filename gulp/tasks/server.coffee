module.exports = (gulp, plugins, config)->
  gulp.task 'server', ()->
    plugins.connect.server
      root: config.dir.build.base
      livereload: config.isDevelopment
    