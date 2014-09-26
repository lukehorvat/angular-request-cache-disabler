# angular-request-cache-disabler

A module for AngularJS that disables HTTP request caching by appending a "random" value to the URL query string. Necessary for old web browsers that aggressively cache AJAX requests (e.g. Internet Explorer 8).

Let's bust them caches wide open!

## Usage


Manually add [angular-request-cache-disabler.js](/dist/angular-request-cache-disabler.js) file to your application, or install with Bower:

```bash
$ bower install angular-request-cache-disabler
```

Add it to an Angular module's dependency list:

```javascript
angular.module("app", ["ngRequestCacheDisabler"])
```

Inject `ngRequestCacheDisablerProvider` into a module's config function. This provider has two settable properties:

- `canDisableCache` - A function that accepts a URL as an argument and returns a boolean indicating whether caching should be disabled.
- `queryStringKey` - A string to use as the key for the value appended to the URL query string. This is optional and defaults to "dc".

For example, the following setup performs cache busting for all request URLs starting with http://github.com/api/v1/:

```javascript
.config(function(ngRequestCacheDisablerProvider) {
  ngRequestCacheDisablerProvider.canDisableCache = function(url) {
    return url.indexOf("http://github.com/api/v1/") === 0;
  };
}
```

Cool. We cache buster now.
