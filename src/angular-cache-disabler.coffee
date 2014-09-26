angular.module "ngCacheDisabler", []

.config ($httpProvider) -> $httpProvider.interceptors.push "ngCacheDisabler"

.provider "ngCacheDisabler", ($httpProvider) ->

  class ngCacheDisabler
    constructor: ->
      @fn = -> console.log arguments

    $get: ($q) ->
      request: (config) =>
        if @fn? and @fn(config.url)
          config.url += if config.url.indexOf("?") >= 0 then "&" else "?"
          config.url += "disableCache=#{new Date().getTime()}"
        return config or $q.when config

  new ngCacheDisabler()
