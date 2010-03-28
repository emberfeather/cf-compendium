/**
 * Base
 * 
 * Used to unobtrusively enhance the user experience.
 */
;(function($) {
	$(function() {
		// Do nothing...yet
	});
})(jQuery);/**
 * Form
 * 
 * Used to unobtrusively enhance the form experience for the user.
 */
;(function($) {
	$(function() {
		var elements = $('.form .element');
		
		// Create the duplication link
		var duplicateLink = $('<a />', {
				href: '#',
				click: function() {
					$(this)
						.parent('.element')
						.duplicateElement();
					
					return false;
				},
				className: 'duplicate'
			});
		
		// Add an image to the duplication link
		duplicateLink.append(
				$('<img />', {
					src: '/cf-compendium/img/icon/famfamfam/silk/add.png',
					title: 'Add multiple' // TODO use i18n
				})
			);
		
		// Create the deletion link
		var deleteLink = $('<a />', {
				href: '#',
				click: function() {
					$(this)
						.parent('.element')
						.removeElement();
					
					return false;
				},
				className: 'delete'
			});
		
		// Add an image to the delete link 
		deleteLink.append(
				$('<img />', {
					src: '/cf-compendium/img/icon/famfamfam/silk/delete.png',
					title: 'Remove' // TODO use i18n
				})
			);
		
		// Add the duplicate functionality
		$('.allowDuplication', elements).each( function() {
			$(this).after( duplicateLink.clone(true) );
		});
		
		// Add the deletion functionality
		$('.allowDeletion', elements).each( function() {
			$(this).after( deleteLink.clone(true) );
		});
	});
	
	/**
	 * Duplicate the given element and add it into the DOM directly after 
	 * current element.
	 */
	$.fn.duplicateElement = function() {
		return this.each(function(){
			original = $(this);
			
			// Clone the element
			clone = $(this).clone(true).addClass('clone');
			
			// Increment the clone counters
			original.data('cloneLength', (original.data('cloneLength') || 0) + 1);
			original.data('cloneCount', (original.data('cloneCount') || 0) + 1);
			
			// Include reference back to original
			clone.data('original', original);
			
			// Remove the duplication class
			$('.allowDuplication', clone).removeClass('allowDuplication');
			
			// Remove the duplication link
			$('.duplicate', clone).remove();
			
			// Remove any values in the inputs
			$('input[type=text], input[type=password], input[type=file]', clone).val('');
			
			// Make all the ids and names unique using the clone counter
			makeUnique(clone, 'clone' + original.data('cloneCount'));
			
			// Add after the curent element
			$(this).after(clone);
			
			// Set the focus on the input in the clone
			$('input', clone).focus();
		});
	}
	
	/**
	 * Delete the given element with some extra checking.
	 */
	$.fn.removeElement = function() {
		return this.each(function(){
			current = $(this);
			
			// Check if it requires confirmation
			if( $('.confirm', current).length ) {
				// Make a confirmation message
				// TODO use i18n
				// TODO make this more specialize with information about the element
				confirmMsg = 'Are you sure you want to remove this?';
				
				if( !confirm( confirmMsg ) )
					return;
			}
			
			// Check if this is a clone
			if(current.hasClass('clone')) {
				original = current.data('original');
				
				// Decrement the clone counter
				original.data('cloneLength', (original.data('cloneLength') || 0) - 1);
			}
			
			// Remove the element
			current.remove();
		});
	}
	
	/**
	 * Used to replace any names and ids with new unique names
	 */
	function makeUnique(element, unique) {
		// Function for adjusting the attribute value with the new unique value
		adjust = function(index, attr){
			if (attr == undefined)
				return;
			
			return (attr == '' ? '' : attr + '-' + unique);
		};
		
		// Change all sensitive attributes
		$('[id], [name], [for]', element)
			.attr('id', adjust)
			.attr('name', adjust)
			.attr('for', adjust);
	}
})(jQuery);/**
 * List JavaScript
 * 
 * Used to unobtrusively enhance the list experience for the user.
 */
;(function($) {
	$(function() {
		$('.list li:even:not(.header)').addClass('alt');
	});
})(jQuery);/**
 * Datagrid JavaScript
 * 
 * Used to unobtrusively enhance the datagrid experience for the user.
 */
;(function($) {
	$.fn.datagrid = function(options) {
		var opts = $.extend({}, $.fn.datagrid.defaults, options);
		
		return this.each(function() {
			$this = $(this);
			
			// Build element specific options
			var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
			
			// Add classes for styling
			$this.addClass(o.classDatagrid).addClass(o.classActive);
			
			// Add the delete confirmation
			$('a.delete', $this).click(confirmDelete);
		});
	};
	
	/*
	 * Public
	 */
	
	// Version Information
	$.fn.datagrid.version = '0.1.0';
	
	// Defaults
	$.fn.datagrid.defaults = {
		classActive: 'active',
		classDatagrid: 'datagrid',
		columnExp: /column-([0-9]+)/i
	};
	
	/*
	 * Private
	 */
	
	function confirmDelete() {
		title = $(this).attr('title') || 'this item';
		
		return confirm('Are you sure you want to remove ' + title + '?');
	} // function
})(jQuery);/*
 * timeago: a jQuery plugin, version: 0.8.0 (2009-10-25)
 * @requires jQuery v1.2.3 or later
 *
 * Timeago is a jQuery plugin that makes it easy to support automatically
 * updating fuzzy timestamps (e.g. "4 minutes ago" or "about 1 day ago").
 *
 * For usage and examples, visit:
 * http://timeago.yarp.com/
 *
 * Licensed under the MIT:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright (c) 2008-2009, Ryan McGeary (ryanonjavascript -[at]- mcgeary [*dot*] org)
 */
(function($) {
  $.timeago = function(timestamp) {
    if (timestamp instanceof Date) return inWords(timestamp);
    else if (typeof timestamp == "string") return inWords($.timeago.parse(timestamp));
    else return inWords($.timeago.datetime(timestamp));
  };
  var $t = $.timeago;

  $.extend($.timeago, {
    settings: {
      refreshMillis: 60000,
      allowFuture: false,
      strings: {
        prefixAgo: null,
        prefixFromNow: null,
        suffixAgo: "ago",
        suffixFromNow: "from now",
        ago: null, // DEPRECATED, use suffixAgo
        fromNow: null, // DEPRECATED, use suffixFromNow
        seconds: "less than a minute",
        minute: "about a minute",
        minutes: "%d minutes",
        hour: "about an hour",
        hours: "about %d hours",
        day: "a day",
        days: "%d days",
        month: "about a month",
        months: "%d months",
        year: "about a year",
        years: "%d years"
      }
    },
    inWords: function(distanceMillis) {
      var $l = this.settings.strings;
      var prefix = $l.prefixAgo;
      var suffix = $l.suffixAgo || $l.ago;
      if (this.settings.allowFuture) {
        if (distanceMillis < 0) {
          prefix = $l.prefixFromNow;
          suffix = $l.suffixFromNow || $l.fromNow;
        }
        distanceMillis = Math.abs(distanceMillis);
      }

      var seconds = distanceMillis / 1000;
      var minutes = seconds / 60;
      var hours = minutes / 60;
      var days = hours / 24;
      var years = days / 365;

      var words = seconds < 45 && substitute($l.seconds, Math.round(seconds)) ||
        seconds < 90 && substitute($l.minute, 1) ||
        minutes < 45 && substitute($l.minutes, Math.round(minutes)) ||
        minutes < 90 && substitute($l.hour, 1) ||
        hours < 24 && substitute($l.hours, Math.round(hours)) ||
        hours < 48 && substitute($l.day, 1) ||
        days < 30 && substitute($l.days, Math.floor(days)) ||
        days < 60 && substitute($l.month, 1) ||
        days < 365 && substitute($l.months, Math.floor(days / 30)) ||
        years < 2 && substitute($l.year, 1) ||
        substitute($l.years, Math.floor(years));

      return $.trim([prefix, words, suffix].join(" "));
    },
    parse: function(iso8601) {
      var s = $.trim(iso8601);
      s = s.replace(/-/,"/").replace(/-/,"/");
      s = s.replace(/T/," ").replace(/Z/," UTC");
      s = s.replace(/([\+-]\d\d)\:?(\d\d)/," $1$2"); // -04:00 -> -0400
      return new Date(s);
    },
    datetime: function(elem) {
      var iso8601 = $(elem).is('time') ? $(elem).attr('datetime') : $(elem).attr('title');
      return $t.parse(iso8601);
    }
  });

  $.fn.timeago = function() {
    var self = this;
    self.each(refresh);

    var $s = $t.settings;
    if ($s.refreshMillis > 0) {
      setInterval(function() { self.each(refresh); }, $s.refreshMillis);
    }
    return self;
  };

  function refresh() {
    var data = prepareData(this);
    if (!isNaN(data.datetime)) {
      $(this).text(inWords(data.datetime));
    }
    return this;
  }

  function prepareData(element) {
    element = $(element);
    if (element.data("timeago") === undefined) {
      element.data("timeago", { datetime: $t.datetime(element) });
      var text = $.trim(element.text());
      if (text.length > 0) element.attr("title", text);
    }
    return element.data("timeago");
  }

  function inWords(date) {
    return $t.inWords(distance(date));
  }

  function distance(date) {
    return (new Date().getTime() - date.getTime());
  }

  function substitute(stringOrFunction, value) {
    var string = $.isFunction(stringOrFunction) ? stringOrFunction(value) : stringOrFunction;
    return string.replace(/%d/i, value);
  }

  // fix for IE6 suckage
  document.createElement('abbr');
  document.createElement('time');
})(jQuery);
