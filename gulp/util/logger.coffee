gutil = require("gulp-util")
notify = require("gulp-notify")
prettyHrtime = require("pretty-hrtime")
startTimes = {}
module.exports =
  start: (name) ->
    startTimes[name] = process.hrtime()
    gutil.log "Running", gutil.colors.green("'#{name}'") + "..."
    return

  end: (name) ->
    taskTime = process.hrtime(startTimes[name])
    prettyTime = prettyHrtime(taskTime)
    gutil.log "Finished", gutil.colors.green("'#{name}'"), "in", gutil.colors.magenta(prettyTime)
    return

  error: ->
    args = Array::slice.call(arguments)
    # Send error to notification center with gulp-notify
    notify.onError(
      title: "Compile Error"
      message: "<%= error %>"
    ).apply this, args
    
    # Keep gulp from hanging on this task
    @emit "end"
    return