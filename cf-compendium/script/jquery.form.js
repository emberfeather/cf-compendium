/**
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
})(jQuery);