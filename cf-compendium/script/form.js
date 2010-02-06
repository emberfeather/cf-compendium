/**
 * Form
 * 
 * Used to unobtrusively enhance the form experience for the user.
 */
;(function($) {
	$(function() {
		// Add the duplicate functionality
		$('.form .element .allowDuplication')
			.after(
				$('<a />', {
					href: '#',
					click: function() {
						$(this)
							.parent('.element')
							.duplicateElement();
					},
					className: 'duplicate'
				}).append($('<img />', {
					src: '/cf-compendium/img/icon/famfamfam/silk/add.png',
					title: 'Add multiple' // TODO use i18n
				}))
			);
	});
	
	/**
	 * Duplicate the given element and add it into the DOM directly after 
	 * current element.
	 */
	$.fn.duplicateElement = function() {
		return this.each(function(){
			original = $(this);
			
			// Clone the elment
			clone = $(this).clone(true).addClass('clone');
			
			// Increment the clone counter
			original.data('cloneCount', (original.data('cloneCount') || 0) + 1);
			
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
})(jQuery);