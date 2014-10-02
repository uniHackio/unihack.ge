/* browserify task
   ---------------
   Bundle javascripty things with browserify!

   If the watch task is running, this uses watchify instead
   of browserify for faster bundling using caching.
*/
var browserify   = require('browserify')
  , watchify     = require('watchify')
  , bundleLogger = require('../util/bundleLogger')
  , gulp         = require('gulp')
  , handleErrors = require('../util/handleErrors')
  , source       = require('vinyl-source-stream')
  , gutil        = require('gulp-util')
  , gulpIf       = require('gulp-if')
  , streamify    = require('gulp-streamify')
  , connect      = require('gulp-connect')
  , uglify       = require('gulp-uglify')
  , debug        = gutil.env.type !== 'production'
  , stripDebug   = require('gulp-strip-debug')
  , hbsfy        = require("hbsfy").configure({
    extensions: ["cssfy"]
  });

gulp.task('browserify', function() {
 
  var bundler = browserify({
    //for watchify
    cache: {}, packageCache: {}, fullPaths: debug,
    // Specify the entry point of your app
    entries: ['./src/scripts/app.coffee'],
    // Add file extentions to make optional in your requires
    extensions: ['.coffee','.cssfy '],
    // Enable source maps!
    debug: debug
  });

  bundler.transform(hbsfy)
  if(global.isWatching) {
    bundler = watchify(bundler)
  }
  var bundle = function() {
    // Log when bundling starts
    bundleLogger.start();

    return bundler
      .bundle()
      // Report compile errors
      .on('error', handleErrors)
      // Use vinyl-source-stream to make the
      // stream gulp compatible. Specifiy the
      // desired output filename here.
      .pipe(source('app.js'))
      // Specify the output destination
      .pipe(streamify(gulpIf(!debug,stripDebug())))
      .pipe(streamify(gulpIf(!debug,uglify())))
      .pipe(gulp.dest('./build/'))
      .pipe(connect.reload())
      // Log when bundling completes!
      .on('end', bundleLogger.end);
  };

  if(global.isWatching) {
    // Rebundle with watchify on changes.
    bundler.on('update', bundle);
  }

  return bundle();
});