es = require('event-stream')
localizer = require('../util/t')
module.exports = (gulp, plugins, config)->
  gulp.task 'htdocs', ->
    i18n = localizer(config.defaultLanguageKey,config.locals)
    stream = gulp
      .src(config.dir.src.htdocs + "index.jade")
    files = []
    loop
      t = i18n.get()
      file = stream
        .pipe plugins.clone()
        .pipe plugins.jade
          pretty: config.idDevelopment
          locals:i18n.use(config.data,t)
        .pipe plugins.rename
          dirname: t('languagePrefix')
      files.push file
      break if i18n.next()
    return es.merge.apply(es,files)
      .pipe(gulp.dest(config.dir.build.base))
      .pipe plugins.connect.reload()