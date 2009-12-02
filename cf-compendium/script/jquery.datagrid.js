/**
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
			
			// Add the alternating rows
			$('tbody tr:even', $this).addClass(o.classAlt);
			
			// Add the delete confirmation
			$('a.delete', $this).click(confirmDelete);
			
			// Add the row hovering
			$('tbody tr', $this).hover(function() {
				$(this).addClass(o.classHover);
			}, function() {
				$(this).removeClass(o.classHover);
			});
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
		classAlt: 'alt',
		classDatagrid: 'datagrid',
		classHover: 'hover',
		classPhantom: 'phantom',
		columnExp: /column-([0-9]+)/i
	};
	
	/*
	 * Private
	 */
	
	function confirmDelete() {
		title = $(this).attr('title') || 'this item';
		
		return confirm('Are you sure you want to remove ' + title + '?');
	} // function
})(jQuery);