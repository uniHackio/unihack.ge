module.exports = (gulp, plugins, config)->
  gulp.task 'watch', ['server', 'build'], ()->
    gulp.watch(config.dir.src.styles + "**", ['styles'])
    gulp.watch(config.dir.src.images + "**", ['images'])
    gulp.watch(config.dir.src.htdocs + "**", ['htdocs'])
    gulp.watch(config.dir.src.locals, ['htdocs']).on 'change', (event)->
      config.updateLocals()