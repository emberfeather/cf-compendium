(function(b){b(function(){})})(jQuery);
(function(b){function f(h,e){adjust=function(i,d){if(d!=undefined)return d==""?"":d+"-"+e};b("[id], [name], [for]",h).attr("id",adjust).attr("name",adjust).attr("for",adjust)}b(function(){b(".form .element .allowDuplication").after(b("<a />",{href:"#",click:function(){b(this).parent(".element").duplicateElement();return false},className:"duplicate"}).append(b("<img />",{src:"/cf-compendium/img/icon/famfamfam/silk/add.png",title:"Add multiple"})));b(".form .element .allowDeletion").after(b("<a />",{href:"#",
click:function(){b(this).parent(".element").removeElement();return false},className:"delete"}).append(b("<img />",{src:"/cf-compendium/img/icon/famfamfam/silk/delete.png",title:"Remove"})))});b.fn.removeElement=function(){return this.each(function(){current=b(this);if(b(".confirm",current).length){confirmMsg="Are you sure you want to remove this?";if(!confirm(confirmMsg))return}if(current.hasClass("clone")){original=current.data("original");original.data("cloneLength",(original.data("cloneLength")||
0)-1)}current.remove()})};b.fn.duplicateElement=function(){return this.each(function(){original=b(this);clone=b(this).clone(true).addClass("clone");original.data("cloneLength",(original.data("cloneLength")||0)+1);original.data("cloneCount",(original.data("cloneCount")||0)+1);clone.data("original",original);b(".allowDuplication",clone).removeClass("allowDuplication");b(".duplicate",clone).remove();b("input[type=text], input[type=password], input[type=file]",clone).val("");f(clone,"clone"+original.data("cloneCount"));
b(this).after(clone);b("input",clone).focus()})}})(jQuery);(function(b){b(function(){b(".list li:even:not(.header)").addClass("alt")})})(jQuery);
(function(b){function f(){title=b(this).attr("title")||"this item";return confirm("Are you sure you want to remove "+title+"?")}b.fn.datagrid=function(h){var e=b.extend({},b.fn.datagrid.defaults,h);return this.each(function(){$this=b(this);var i=b.meta?b.extend({},e,$this.data()):e;$this.addClass(i.classDatagrid).addClass(i.classActive);b("a.delete",$this).click(f)})};b.fn.datagrid.version="0.1.0";b.fn.datagrid.defaults={classActive:"active",classDatagrid:"datagrid",columnExp:/column-([0-9]+)/i}})(jQuery);
(function(b){function f(){var a=h(this);isNaN(a.datetime)||b(this).text(e(a.datetime));return this}function h(a){a=b(a);if(a.data("timeago")===undefined){a.data("timeago",{datetime:j.datetime(a)});var c=b.trim(a.text());c.length>0&&a.attr("title",c)}return a.data("timeago")}function e(a){return j.inWords(i(a))}function i(a){return(new Date).getTime()-a.getTime()}function d(a,c){return(b.isFunction(a)?a(c):a).replace(/%d/i,c)}b.timeago=function(a){return a instanceof Date?e(a):typeof a=="string"?e(b.timeago.parse(a)):
e(b.timeago.datetime(a))};var j=b.timeago;b.extend(b.timeago,{settings:{refreshMillis:6E4,allowFuture:false,strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",ago:null,fromNow:null,seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years"}},inWords:function(a){var c=this.settings.strings,m=c.prefixAgo,
n=c.suffixAgo||c.ago;if(this.settings.allowFuture){if(a<0){m=c.prefixFromNow;n=c.suffixFromNow||c.fromNow}a=Math.abs(a)}a=a/1E3;var k=a/60,l=k/60,g=l/24,o=g/365;c=a<45&&d(c.seconds,Math.round(a))||a<90&&d(c.minute,1)||k<45&&d(c.minutes,Math.round(k))||k<90&&d(c.hour,1)||l<24&&d(c.hours,Math.round(l))||l<48&&d(c.day,1)||g<30&&d(c.days,Math.floor(g))||g<60&&d(c.month,1)||g<365&&d(c.months,Math.floor(g/30))||o<2&&d(c.year,1)||d(c.years,Math.floor(o));return b.trim([m,c,n].join(" "))},parse:function(a){a=
b.trim(a);a=a.replace(/-/,"/").replace(/-/,"/");a=a.replace(/T/," ").replace(/Z/," UTC");a=a.replace(/([\+-]\d\d)\:?(\d\d)/," $1$2");return new Date(a)},datetime:function(a){a=b(a).is("time")?b(a).attr("datetime"):b(a).attr("title");return j.parse(a)}});b.fn.timeago=function(){var a=this;a.each(f);var c=j.settings;c.refreshMillis>0&&setInterval(function(){a.each(f)},c.refreshMillis);return a};document.createElement("abbr");document.createElement("time")})(jQuery);
