/*

 RequireJS plugin for loading files without adding the JS extension, useful for
 JSONP services and any other kind of resource that already contain a file
 extension or that shouldn't have one (like dynamic scripts).
 Author: Miller Medeiros
 Version: 0.3.0 (2011/10/26)
 Released under the WTFPL
*/
define(function(){return{load:function(a,b,c){a=b.toUrl(a).replace(/\.js$/,"");b([a],function(a){c(a)})},normalize:function(a){a+=a.indexOf("?")<0?"?":"&";return a+"noext=1"}}});
