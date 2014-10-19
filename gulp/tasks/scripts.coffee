createBundler = (config)->
  browserify   = require('browserify')
  return browserify
    entries: [config.dir.src.scripts]
    extensions: ['.coffee','.cssfy ']

    # Enable source maps!
    debug: config.isDevelopment

    #for watchify
    cache: {}
    packageCache: {}
    fullPaths: config.isDevelopment

setUpBundler = (bundler, config)->
  hbsfy = require("hbsfy").configure
    extensions: ["cssfy"]
  bundler.transform(hbsfy)
  watchify = require('watchify')
  bundler = watchify(bundler)  if config.isWatching
  return bundler

pipeBundlerToBundle = (bundler,bundle,config)->
  # Rebundle with watchify on changes.
  bundler.on "update", bundle.bind(undefined,bundler)  if config.isWatching
  return bundle(bundler)

module.exports = (gulp, plugins, config)->
  source = require('vinyl-source-stream')
  gulp.task 'scripts', ->
    return pipeBundlerToBundle(setUpBundler(createBundler(config),config), ((bundler)->
      config.logger.start('scripts')
      stream = bundler.bundle()
        .on "error", config.logger.error
        .pipe(source(config.dir.build.script))
      if(config.isProduction)
        stream.pipe(plugins.streamify(plugins.stripDebug())) 
        stream.pipe(plugins.streamify(plugins.uglify()))
      stream.pipe(gulp.dest(config.dir.build.base))
        .pipe(plugins.if(config.isDevelopment,plugins.connect.reload()))
        .on "end", config.logger.end.bind(undefined,'scripts')
      return stream
    ), config)
