/*

 RequireJS plugin for loading Google Ajax API modules thru `google.load`
 Author: Miller Medeiros
 Version: 0.1.0 (2011/11/21)
 Released under the WTFPL
*/
define(["async"],function(){function d(a){a=b.exec(a);return{moduleName:a[1],version:a[2]||"1",packages:a[3]?a[3].split(","):[]}}var b=/^(^\w+)(?:,([^,]+))?(?:,\[([^\]]+)\])?/;return{load:function(a,b,e){var c=d(a);b(["async!"+document.location.protocol+"//www.google.com/jsapi"],function(){google.load(c.moduleName,c.version,{packages:c.packages,callback:e})})}}});
