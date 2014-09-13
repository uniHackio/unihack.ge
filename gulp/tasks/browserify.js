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
  , connect = require('gulp-connect');

gulp.task('browserify', function() {
 
  var bundler = browserify({
    //for watchify
    cache: {}, packageCache: {}, fullPaths: true,
    // Specify the entry point of your app
    entries: ['./src/js/app.coffee'],
    // Add file extentions to make optional in your requires
    extensions: ['.coffee'],
    // Enable source maps!
    debug: true
  });

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