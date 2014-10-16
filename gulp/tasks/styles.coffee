nib = require("nib")
module.exports = (gulp, plugins, config)->
  gulp.task 'styles', ->
    return gulp
      .src(config.dir.src.styles + "style.styl")
      .pipe plugins.plumber()
      .pipe plugins.progeny()
      .pipe plugins.stylus
        use: [nib()]
        compress: config.isProduction
        sourcemap: if config.isDevelopment then(
          inline: true
          sourceRoot: ".."
          basePath: "css"
        ) else false
      .pipe(plugins.filter([ "**.*", "!**/_*.css"]))
      .pipe(gulp.dest(config.dir.build.base))
      .pipe plugins.connect.reload()
