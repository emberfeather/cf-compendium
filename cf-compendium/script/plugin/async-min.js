/*

 RequireJS plugin for async dependency load like JSONP and Google Maps
 Author: Miller Medeiros
 Version: 0.1.1 (2011/11/17)
 Released under the WTFPL
*/
define(function(){var e=0;return{load:function(a,b,c,d){d.isBuild?c(null):(e+=1,b="__async_req_"+e+"__",window[b]=c,d=/!(.+)/,c=a.replace(d,""),a=d.test(a)?a.replace(/.+!/,""):"callback",c+=c.indexOf("?")<0?"?":"&",b=c+a+"="+b,a=document.createElement("script"),a.type="text/javascript",a.async=true,a.src=b,b=document.getElementsByTagName("script")[0],b.parentNode.insertBefore(a,b))}}});
