(function(c){function j(){var a=n(this);isNaN(a.datetime)||c(this).text(f(a.datetime));return this}function n(a){a=c(a);if(!a.data("timeago")){a.data("timeago",{datetime:g.datetime(a)});var b=c.trim(a.text());b.length>0&&a.attr("title",b)}return a.data("timeago")}function f(a){return g.inWords(o(a))}function o(a){return(new Date).getTime()-a.getTime()}function d(a,b){return(c.isFunction(a)?a(b):a).replace(/%d/i,b)}c.timeago=function(a){return a instanceof Date?f(a):typeof a=="string"?f(c.timeago.parse(a)):
f(c.timeago.datetime(a))};var g=c.timeago;c.extend(c.timeago,{settings:{refreshMillis:6E4,allowFuture:false,strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",ago:null,fromNow:null,seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years"}},inWords:function(a){var b=this.settings.strings,k=b.prefixAgo,
l=b.suffixAgo||b.ago;if(this.settings.allowFuture){if(a<0){k=b.prefixFromNow;l=b.suffixFromNow||b.fromNow}a=Math.abs(a)}a=a/1E3;var h=a/60,i=h/60,e=i/24,m=e/365;b=a<45&&d(b.seconds,Math.round(a))||a<90&&d(b.minute,1)||h<45&&d(b.minutes,Math.round(h))||h<90&&d(b.hour,1)||i<24&&d(b.hours,Math.round(i))||i<48&&d(b.day,1)||e<30&&d(b.days,Math.floor(e))||e<60&&d(b.month,1)||e<365&&d(b.months,Math.floor(e/30))||m<2&&d(b.year,1)||d(b.years,Math.floor(m));return c.trim([k,b,l].join(" "))},parse:function(a){a=
c.trim(a);a=a.replace(/-/,"/").replace(/-/,"/");a=a.replace(/T/," ").replace(/Z/," UTC");a=a.replace(/([\+-]\d\d)\:?(\d\d)/," $1$2");return new Date(a)},datetime:function(a){a=c(a).get(0).tagName.toLowerCase()=="time"?c(a).attr("datetime"):c(a).attr("title");return g.parse(a)}});c.fn.timeago=function(){var a=this;a.each(j);var b=g.settings;b.refreshMillis>0&&setInterval(function(){a.each(j)},b.refreshMillis);return a};document.createElement("abbr");document.createElement("time")})(jQuery);
