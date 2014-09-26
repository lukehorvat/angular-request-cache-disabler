# angular-cache-disabler

A module for AngularJS that disables HTTP request caching by appending a "random" value to the URL query string. Necessary for old browsers that aggressively cache AJAX requests (e.g. Internet Explorer 8).

Let's bust them caches wide open!

## Usage


Manually add [angular-cache-disabler.js](/dist/angular-cache-disabler.js) file to your application, or install with Bower:

```bash
$ bower install angular-cache-disabler
```

Add it to an Angular module's dependency list:

```javascript
angular.module("app", ["ngCacheDisabler"])
```

Inject `ngCacheDisablerProvider` into a module's config function. This object has two properties that can be set:

- `canDisableCache` - A function that accepts a URL as an argument and returns a boolean indicating whether caching should be disabled.
- `queryStringKey` - A string to use as the key for the value appended to the URL query string. This is optional and defaults to "disableCache".

For example, the following setup performs cache busting for all request URLs starting with http://github.com/api/v1/:

```javascript
.config(function(ngCacheDisablerProvider) {
  ngCacheDisablerProvider.canDisableCache = function(url) {
    return url.indexOf("http://github.com/api/v1/") === 0;
  };
}
```

Cool.
