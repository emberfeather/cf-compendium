(function(a){function f(b,c){var d=b.parent(".element");d=a(".options",d);if(!d.length){d=a("<span />",{className:"options"});b.after(d)}d.append(c)}function g(b){var c=a("<button />",{text:"Remove",click:function(){a(this).parents(".element").removeElement();return false},className:"delete"}).button({icons:{primary:"ui-icon-circle-minus"},text:false});a(".allowDeletion",b).each(function(){f(a(this),c.clone(true))})}function h(b){var c=a("<button />",{text:"Add multiple",click:function(){a(this).parents(".element").duplicateElement();
return false},className:"duplicate"}).button({icons:{primary:"ui-icon-circle-plus"},text:false});a(".allowDuplication",b).each(function(){f(a(this),c.clone(true))})}function i(b,c){adjust=function(d,e){if(e!=undefined)return e==""?"":e+"-"+c};a("[id], [name], [for]",b).attr("id",adjust).attr("name",adjust).attr("for",adjust)}a(function(){var b=a(".form .element");g(b);h(b);a(".options",b).buttonset()});a.fn.duplicateElement=function(){return this.each(function(){original=a(this);clone=a(this).clone(true).addClass("clone");
original.data("cloneLength",(original.data("cloneLength")||0)+1);original.data("cloneCount",(original.data("cloneCount")||0)+1);clone.data("original",original);a(".allowDuplication",clone).removeClass("allowDuplication");a(".duplicate",clone).remove();a("input[type=text], input[type=password], input[type=file]",clone).val("");i(clone,"clone"+original.data("cloneCount"));a(this).after(clone);a("input",clone).focus()})};a.fn.removeElement=function(){return this.each(function(){current=a(this);if(a(".confirm",
current).length){confirmMsg="Are you sure you want to remove this?";if(!confirm(confirmMsg))return}if(current.hasClass("clone")){original=current.data("original");original.data("cloneLength",(original.data("cloneLength")||0)-1)}current.remove()})}})(jQuery);
