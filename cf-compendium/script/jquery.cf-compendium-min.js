(function(b){b.cfc={}})(jQuery);
(function(b){function h(a,c){var g=a.parent(".element");g=b(".modifiers",g);if(!g.length){g=b("<span />",{className:"modifiers"});a.after(g)}g.append(c)}function f(a){var c=b("<button />",{text:"Remove",click:function(){b(this).parents(".element").removeElement();return false},className:"delete"}).button({icons:{primary:"ui-icon-circle-minus"},text:false});c[0].setAttribute("type","button");b(".allowDeletion",a).each(function(){h(b(this),c.clone(true))})}function d(a){var c=b("<button />",{text:"Add multiple",
click:function(){b(this).parents(".element").duplicateElement();return false},className:"duplicate"}).button({icons:{primary:"ui-icon-circle-plus"},text:false});c[0].setAttribute("type","button");b(".allowDuplication",a).each(function(){h(b(this),c.clone(true))})}function e(a,c){adjust=function(g,i){if(i!=undefined)return i==""?"":i+"-"+c};b("[id], [name], [for]",a).attr("id",adjust).attr("name",adjust).attr("for",adjust)}b(function(){var a=b(".form .element");f(a);d(a);b(".modifiers",a).buttonset()});
b.fn.duplicateElement=function(){return this.each(function(){original=b(this);clone=b(this).clone(true).addClass("clone");original.data("cloneLength",(original.data("cloneLength")||0)+1);original.data("cloneCount",(original.data("cloneCount")||0)+1);clone.data("original",original);b(".allowDuplication",clone).removeClass("allowDuplication");b(".duplicate",clone).remove();b("input[type=text], input[type=password], input[type=file]",clone).val("");e(clone,"clone"+original.data("cloneCount"));b(this).after(clone);
b("input",clone).focus()})};b.fn.removeElement=function(){return this.each(function(){current=b(this);if(b(".confirm",current).length){confirmMsg="Are you sure you want to remove this?";if(!confirm(confirmMsg))return}if(current.hasClass("clone")){original=current.data("original");original.data("cloneLength",(original.data("cloneLength")||0)-1)}current.remove()})}})(jQuery);(function(b){b(function(){b(".list li:even:not(.header)").addClass("alt")})})(jQuery);
(function(b){function h(d){var e=b(this),a=e.attr("href");e=e.data("title")||"this item";if(!f){f=b("<div />",{title:"Delete item?"});f.appendTo(b("body"))}d.preventDefault();f.empty().append(b("<p />",{text:"Are you sure you want to remove "+e+"?"}));f.dialog({resizable:false,modal:true,buttons:{"Delete Item":function(){window.location.href=a},Cancel:function(){f.dialog("close")}}})}var f;b.fn.datagrid=function(d){var e=b.extend({},b.fn.datagrid.defaults,d);return this.each(function(){$this=b(this);
var a=b.meta?b.extend({},e,$this.data()):e;$this.addClass(a.classDatagrid).addClass(a.classActive);b("a.delete",$this).click(h)})};b.fn.datagrid.version="0.1.0";b.fn.datagrid.defaults={classActive:"active",classDatagrid:"datagrid",columnExp:/column-([0-9]+)/i}})(jQuery);
(function(b){function h(){var a;a=this;a=b(a);if(!a.data("timeago")){a.data("timeago",{datetime:e.datetime(a)});var c=b.trim(a.text());c.length>0&&a.attr("title",c)}a=a.data("timeago");isNaN(a.datetime)||b(this).text(f(a.datetime));return this}function f(a){return e.inWords((new Date).getTime()-a.getTime())}function d(a,c){return(b.isFunction(a)?a(c):a).replace(/%d/i,c)}b.timeago=function(a){return a instanceof Date?f(a):typeof a=="string"?f(b.timeago.parse(a)):f(b.timeago.datetime(a))};var e=b.timeago;
b.extend(b.timeago,{settings:{refreshMillis:6E4,allowFuture:false,strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",ago:null,fromNow:null,seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years"}},inWords:function(a){var c=this.settings.strings,g=c.prefixAgo,i=c.suffixAgo||c.ago;if(this.settings.allowFuture){if(a<
0){g=c.prefixFromNow;i=c.suffixFromNow||c.fromNow}a=Math.abs(a)}a=a/1E3;var k=a/60,l=k/60,j=l/24,m=j/365;c=a<45&&d(c.seconds,Math.round(a))||a<90&&d(c.minute,1)||k<45&&d(c.minutes,Math.round(k))||k<90&&d(c.hour,1)||l<24&&d(c.hours,Math.round(l))||l<48&&d(c.day,1)||j<30&&d(c.days,Math.floor(j))||j<60&&d(c.month,1)||j<365&&d(c.months,Math.floor(j/30))||m<2&&d(c.year,1)||d(c.years,Math.floor(m));return b.trim([g,c,i].join(" "))},parse:function(a){a=b.trim(a);a=a.replace(/-/,"/").replace(/-/,"/");a=a.replace(/T/,
" ").replace(/Z/," UTC");a=a.replace(/([\+-]\d\d)\:?(\d\d)/," $1$2");return new Date(a)},datetime:function(a){a=b(a).get(0).tagName.toLowerCase()=="time"?b(a).attr("datetime"):b(a).attr("title");return e.parse(a)}});b.fn.timeago=function(){var a=this;a.each(h);var c=e.settings;c.refreshMillis>0&&setInterval(function(){a.each(h)},c.refreshMillis);return a};document.createElement("abbr");document.createElement("time")})(jQuery);
