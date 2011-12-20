/*

 RequireJS plugin for loading JSON files
 - depends on Text plugin and it was HEAVILY "inspired" by it as well.
 IMPORTANT: it only works on r.js optimizer after version 0.26+ 20011/09/27
 Author: Miller Medeiros
 Version: 0.1.0 (2011/06/10)
 Released under the WTFPL
*/
define(["text"],function(e){var f=typeof JSON!=="undefined"&&typeof JSON.parse==="function"?JSON.parse:function(b){return eval("("+b+")")},d={};return{load:function(b,a,c,g){e.get(a.toUrl(b),function(a){g.isBuild?(d[b]=a,c(a)):c(f(a))})},write:function(b,a,c){a in d&&c('define("'+b+"!"+a+'", function(){ return '+d[a]+";});\n")}}});
