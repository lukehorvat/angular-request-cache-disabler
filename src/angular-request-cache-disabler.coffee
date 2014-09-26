angular.module "ngRequestCacheDisabler", []

.config ($httpProvider) -> $httpProvider.interceptors.push "ngRequestCacheDisabler"

.provider "ngRequestCacheDisabler", $get: ($q) -> request: (config) =>

  if @canDisableCache?(config.url)
    config.url += if config.url.indexOf("?") >= 0 then "&" else "?"
    config.url += "#{@queryStringKey ? "dc"}=#{new Date().getTime()}"
  config or $q.when config
