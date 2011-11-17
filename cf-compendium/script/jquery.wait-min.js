(function(a){typeof define==="function"&&define.amd?define(["jquery"],a):a(jQuery)})(function(a){a.wait=function(c){var b=a.Deferred();setTimeout(function(){b.resolve()},c);return b}});
