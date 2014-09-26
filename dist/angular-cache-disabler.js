(function() {
  angular.module("ngCacheDisabler", []).config(function($httpProvider) {
    return $httpProvider.interceptors.push("ngCacheDisabler");
  }).provider("ngCacheDisabler", function($httpProvider) {
    return {
      $get: function($q) {
        return {
          request: (function(_this) {
            return function(config) {
              var _ref;
              if (typeof _this.canDisableCache === "function" ? _this.canDisableCache(config.url) : void 0) {
                config.url += config.url.indexOf("?") >= 0 ? "&" : "?";
                config.url += "" + ((_ref = _this.queryStringKey) != null ? _ref : "disableCache") + "=" + (new Date().getTime());
              }
              return config || $q.when(config);
            };
          })(this)
        };
      }
    };
  });

}).call(this);
