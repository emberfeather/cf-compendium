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
})(jQuery);