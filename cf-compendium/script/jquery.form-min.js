(function(a){function g(b,d){var c=b.parents(".element"),c=a(".modifiers",c);c.length||(c=a("<span />").addClass("modifiers"),b.after(c));c.append(d)}function h(b){var d=a("<button />",{text:"Remove"}).button({icons:{primary:"ui-icon-circle-minus"},text:!1}).addClass("delete");d[0].setAttribute("type","button");a(".allowDeletion",b).each(function(){g(a(this),d.clone(!0))})}function i(b){var d=a("<button />",{text:"Add multiple"}).button({icons:{primary:"ui-icon-circle-plus"},text:!1}).addClass("duplicate");
d[0].setAttribute("type","button");a(".allowDuplication",b).each(function(){g(a(this),d.clone(!0))})}function j(b,d){adjust=function(b,a){if(a!==void 0)return a===""?"":a+"-"+d};a("[id], [name], [for]",b).attr("id",adjust).attr("name",adjust).attr("for",adjust)}function k(){var b=a(this);b.autocomplete({source:b.data("options"),minLength:b.data("minLength")||0,delay:b.data("delay")||300})}a(function(){var b=a(".form .element");h(b);i(b);a(b).live({"delete":function(){a(this).removeElement()},duplicate:function(){a(this).duplicateElement()}});
a("button.delete",b).live({click:function(){a(this).trigger("delete");return!1}});a("button.duplicate",b).live({click:function(){a(this).trigger("duplicate");return!1}});a(".modifiers",b).buttonset();b.find(".autocomplete").each(k).end();a('input[type="date"]',b).datepicker({dateFormat:"yy-mm-dd"});a('input[type="month"]',b).datepicker({dateFormat:"yy-mm"})});a.fn.duplicateElement=function(){return this.each(function(){var b=a(this),d=b;a("table.datagrid",b).length>0&&(d=a("tr:last",b),b=a("tr:not(.clone):last",
b));var c=b.clone().addClass("clone");b.data("cloneLength",(b.data("cloneLength")||0)+1);b.data("cloneCount",(b.data("cloneCount")||0)+1);c.data("original",b);a(".allowDuplication",c).removeClass("allowDuplication");a(".duplicate",c).remove();a("input[type=text], input[type=password], input[type=file]",c).val("");var e;e=b.data("cloneCount");var f=4;f-=e.toString().length;e=f>0?Array(f+(/\./.test(e)?2:1)).join("0")+e:e;j(c,"clone"+e);d.after(c);c.trigger("afterduplicate",{original:b});a("input:first",
c).focus()})};a.fn.removeElement=function(){return this.each(function(){current=a(this);if(a(".confirm",current).length&&(confirmMsg="Are you sure you want to remove this?",!confirm(confirmMsg)))return;current.hasClass("clone")&&(original=current.data("original"),original.data("cloneLength",(original.data("cloneLength")||0)-1));current.remove()})}})(jQuery);
