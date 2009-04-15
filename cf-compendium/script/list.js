/**
 * List JavaScript
 * 
 * Used to unobtrusively enhance the list experience for the user.
 */
;(function($) {
	$(function() {
		$('.list li:even:not(.header)').addClass('alt');
	});
})(jQuery);