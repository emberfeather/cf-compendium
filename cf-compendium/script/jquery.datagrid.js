/**
 * Datagrid JavaScript
 * 
 * Used to unobtrusively enhance the datagrid experience for the user.
 */
;(function($) {
	var confirmDialog;
	
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
	
	function confirmDelete(e) {
		var current = $(this);
		var targetUrl = current.attr('href');
		var title = current.data('title') || 'this item';
		
		if(!confirmDialog) {
			confirmDialog = $('<div />', {
				title: 'Delete item?'
			});
			
			confirmDialog.appendTo($('body'));
		}
		
		e.preventDefault();
		
		confirmDialog.empty().append($('<p />', {
			text: 'Are you sure you want to remove ' + title + '?'
		}));
		
		confirmDialog.dialog({
			resizable: false,
			modal: true,
			buttons: {
				'Delete Item': function() {
					window.location.href = targetUrl;
				},
				'Cancel': function() {
					confirmDialog.dialog('close');
				}
			}
		});
	}
})(jQuery);