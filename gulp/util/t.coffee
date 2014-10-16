vsprintf = require('sprintf').vsprintf || []
gutil = require("gulp-util")

t = module.exports = (defaultLanguageKey,locals)->
  activeLanguageIndex = 0
  languages = Object.keys(locals)

  return {
    use: (data,t)->
      return Object.keys(data).reduce((result, key)->
        result[key] = data[key]
        return result
      , t:t)
    get: ->
      langIndex = activeLanguageIndex
      (format, args) ->
        args = args || []
        languageCode = languages[langIndex]
        local = locals[languageCode]
        value = local[format]
        if typeof value == 'undefined'
          #warn format is not set for current language
          local = locals[defaultLanguageKey]
          value = local[format]
          if typeof value == 'undefined'
            #warn format is not set for default language
            gutil.log "T: unknown format #{format}";
            value = format
        return vsprintf(value,args)
    next: ->
      activeLanguageIndex += 1
      activeLanguageIndex %= languages.length
      return activeLanguageIndex == 0;
  }