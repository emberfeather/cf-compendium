/*

 RequireJS Image Plugin
 Author: Miller Medeiros
 Version: 0.1.2 (2011/11/17)
 Released under the WTFPL
*/
define(function(){return{load:function(a,e,c,d){var b;d.isBuild?c(null):(b=new Image,b.onload=function(){c(b);delete b.onload},b.src=a)},normalize:function(a){a.indexOf("!bust")<0||(a=a.replace("!bust",""),a+=a.indexOf("?")<0?"?":"&",a=a+"bust="+Math.round(2147483647*Math.random()));return a}}});
