(function(a){a.cfc={}})(jQuery);(function(a){a.wait=function(f){var d=a.Deferred();setTimeout(function(){d.resolve()},f);return d}})(jQuery);
(function(a){function f(){var b;b=a(this);if(!b.data("timeago")){b.data("timeago",{datetime:g.datetime(b)});var e=a.trim(b.text());e.length>0&&b.attr("title",e)}b=b.data("timeago");isNaN(b.datetime)||a(this).text(d(b.datetime));return this}function d(b){return g.inWords((new Date).getTime()-b.getTime())}a.timeago=function(b){return b instanceof Date?d(b):typeof b==="string"?d(a.timeago.parse(b)):d(a.timeago.datetime(b))};var g=a.timeago;a.extend(a.timeago,{settings:{refreshMillis:6E4,allowFuture:false,
strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years",numbers:[]}},inWords:function(b){function e(n,o){return(a.isFunction(n)?n(o,b):n).replace(/%d/i,c.numbers&&c.numbers[o]||o)}var c=this.settings.strings,h=c.prefixAgo,i=c.suffixAgo;if(this.settings.allowFuture){if(b<
0){h=c.prefixFromNow;i=c.suffixFromNow}b=Math.abs(b)}var j=b/1E3,l=j/60,m=l/60,k=m/24,p=k/365;j=j<45&&e(c.seconds,Math.round(j))||j<90&&e(c.minute,1)||l<45&&e(c.minutes,Math.round(l))||l<90&&e(c.hour,1)||m<24&&e(c.hours,Math.round(m))||m<48&&e(c.day,1)||k<30&&e(c.days,Math.floor(k))||k<60&&e(c.month,1)||k<365&&e(c.months,Math.floor(k/30))||p<2&&e(c.year,1)||e(c.years,Math.floor(p));return a.trim([h,j,i].join(" "))},parse:function(b){b=a.trim(b);b=b.replace(/\.\d\d\d+/,"");b=b.replace(/-/,"/").replace(/-/,
"/");b=b.replace(/T/," ").replace(/Z/," UTC");b=b.replace(/([\+\-]\d\d)\:?(\d\d)/," $1$2");return new Date(b)},datetime:function(b){b=a(b).get(0).tagName.toLowerCase()==="time"?a(b).attr("datetime"):a(b).attr("title");return g.parse(b)}});a.fn.timeago=function(){var b=this;b.each(f);var e=g.settings;e.refreshMillis>0&&setInterval(function(){b.each(f)},e.refreshMillis);return b};document.createElement("abbr");document.createElement("time")})(jQuery);
jQuery.cookie=function(a,f,d){if(arguments.length>1&&(f===null||typeof f!=="object")){d=jQuery.extend({},d);if(f===null)d.expires=-1;if(typeof d.expires==="number"){var g=d.expires,b=d.expires=new Date;b.setDate(b.getDate()+g)}return document.cookie=[encodeURIComponent(a),"=",d.raw?String(f):encodeURIComponent(String(f)),d.expires?"; expires="+d.expires.toUTCString():"",d.path?"; path="+d.path:"",d.domain?"; domain="+d.domain:"",d.secure?"; secure":""].join("")}d=f||{};b=d.raw?function(e){return e}:
decodeURIComponent;return(g=RegExp("(?:^|; )"+encodeURIComponent(a)+"=([^;]*)").exec(document.cookie))?b(g[1]):null};
(function(a){function f(c,h){var i=c.parent(".element");i=a(".modifiers",i);if(!i.length){i=a("<span />",{className:"modifiers"});c.after(i)}i.append(h)}function d(c){var h=a("<button />",{text:"Remove",click:function(){a(this).parents(".element").removeElement();return false},className:"delete"}).button({icons:{primary:"ui-icon-circle-minus"},text:false});h[0].setAttribute("type","button");a(".allowDeletion",c).each(function(){f(a(this),h.clone(true))})}function g(c){var h=a("<button />",{text:"Add multiple",
click:function(){a(this).parents(".element").duplicateElement();return false},className:"duplicate"}).button({icons:{primary:"ui-icon-circle-plus"},text:false});h[0].setAttribute("type","button");a(".allowDuplication",c).each(function(){f(a(this),h.clone(true))})}function b(c,h){adjust=function(i,j){if(j!==undefined)return j===""?"":j+"-"+h};a("[id], [name], [for]",c).attr("id",adjust).attr("name",adjust).attr("for",adjust)}function e(){var c=a(this);c.autocomplete({source:c.data("options"),minLength:c.data("minLength")||
0,delay:c.data("delay")||300})}a(function(){var c=a(".form .element");d(c);g(c);a(".modifiers",c).buttonset();c.find(".autocomplete").each(e).end()});a.fn.duplicateElement=function(){return this.each(function(){original=a(this);clone=a(this).clone(true).addClass("clone");original.data("cloneLength",(original.data("cloneLength")||0)+1);original.data("cloneCount",(original.data("cloneCount")||0)+1);clone.data("original",original);a(".allowDuplication",clone).removeClass("allowDuplication");a(".duplicate",
clone).remove();a("input[type=text], input[type=password], input[type=file]",clone).val("");b(clone,"clone"+original.data("cloneCount"));a(this).after(clone);a("input",clone).focus()})};a.fn.removeElement=function(){return this.each(function(){current=a(this);if(a(".confirm",current).length){confirmMsg="Are you sure you want to remove this?";if(!confirm(confirmMsg))return}if(current.hasClass("clone")){original=current.data("original");original.data("cloneLength",(original.data("cloneLength")||0)-
1)}current.remove()})}})(jQuery);(function(a){a(function(){a(".list li:even:not(.header)").addClass("alt")})})(jQuery);
(function(a){function f(g){var b=a(this),e=b.attr("href");b=b.parents("td").data("title")||"this item";if(!d){d=a("<div />",{title:"Delete item?"});d.appendTo(a("body"))}g.preventDefault();d.empty().append(a("<p />",{text:"Are you sure you want to remove "+b+"?"}));d.dialog({resizable:false,modal:true,buttons:{"Delete Item":function(){window.location.href=e},Cancel:function(){d.dialog("close")}}})}var d;a.fn.datagrid=function(g){var b=a.extend({},a.fn.datagrid.defaults,g);return this.each(function(){$this=
a(this);var e=a.meta?a.extend({},b,$this.data()):b;$this.addClass(e.classDatagrid).addClass(e.classActive);a("a.delete",$this).click(f)})};a.fn.datagrid.version="0.1.0";a.fn.datagrid.defaults={classActive:"active",classDatagrid:"datagrid",columnExp:/column-([0-9]+)/i}})(jQuery);
