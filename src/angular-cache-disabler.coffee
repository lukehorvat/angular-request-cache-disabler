angular.module "ngCacheDisabler", []

.config ($httpProvider) -> $httpProvider.interceptors.push "ngCacheDisabler"

.provider "ngCacheDisabler", ($httpProvider) ->

  class ngCacheDisabler
    $get: ($q) ->
      request: (config) =>
        if @canDisableCache? and @canDisableCache(config.url)
          config.url += if config.url.indexOf("?") >= 0 then "&" else "?"
          config.url += "#{@queryStringKey ? "disableCache"}=#{new Date().getTime()}"
        return config or $q.when config

  new ngCacheDisabler()
