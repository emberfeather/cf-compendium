/**
 * Form
 * 
 * Used to unobtrusively enhance the form experience for the user.
 */
(function($) {
	$(function() {
		var elements = $('.form .element');
		
		// Add the deletion functionality
		attachDeletion(elements);
		
		// Add the duplicate functionality
		attachDuplication(elements);
		
		// Make the modifiers into button sets
		$('.modifiers', elements).buttonset();
		
		// Make the autocomplete elements into autocompletes
		elements.find('.autocomplete').each(createAutocomplete).end();
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
			
			// Add after the current element
			$(this).after(clone);
			
			// Set the focus on the input in the clone
			$('input', clone).focus();
		});
	};
	
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
				
				if( !confirm( confirmMsg ) ) {
					return;
				}
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
	};
	
	/**
	 * Adds the given option to the element inside an modifiers span.
	 */
	function addOption (element, option) {
		var elementRow = element.parent('.element');
		var modifiers = $('.modifiers', elementRow);
		
		// If there isn't any modifiers container add make a new one
		if( !modifiers.length ) {
			modifiers = $('<span />', {
				className: 'modifiers'
			});
			
			// Add the modifiers after the element
			element.after(modifiers);
		}
		
		// Add the option
		modifiers.append(option);
	}
	
	/**
	 * Attach delete buttons
	 */
	function attachDeletion( elements ) {
		// Create the deletion link
		var deleteBtn = $('<button />', {
			text: 'Remove', // TODO use i18n
			click: function(event) {
				$(this)
					.parents('.element')
					.removeElement();
				
				return false;
			},
			className: 'delete'
		}).button({
			icons: {
				primary: 'ui-icon-circle-minus'
			},
			text: false
		});
		
		// Since the .attr() will not work for setting the type
		deleteBtn[0].setAttribute('type', 'button');
		
		// Add the deletion functionality
		$('.allowDeletion', elements).each( function() {
			addOption( $(this), deleteBtn.clone(true) );
		});
	}
	
	/**
	 * Attach duplicate buttons
	 */
	function attachDuplication( elements ) {
		// Create the duplication link
		var duplicateBtn = $('<button />', {
			text: 'Add multiple', // TODO use i18n
			click: function() {
				$(this)
					.parents('.element')
					.duplicateElement();
				
				return false;
			},
			className: 'duplicate'
		}).button({
			icons: {
				primary: 'ui-icon-circle-plus'
			},
			text: false
		});
		
		// Since the .attr() will not work for setting the type
		duplicateBtn[0].setAttribute('type', 'button');
		
		// Add the duplicate functionality
		$('.allowDuplication', elements).each( function() {
			addOption( $(this), duplicateBtn.clone(true) );
		});
	}
	
	/**
	 * Used to replace any names and ids with new unique names
	 */
	function makeUnique(element, unique) {
		// Function for adjusting the attribute value with the new unique value
		adjust = function(index, attr){
			if (attr === undefined) {
				return;
			}
			
			return (attr === '' ? '' : attr + '-' + unique);
		};
		
		// Change all sensitive attributes
		$('[id], [name], [for]', element)
			.attr('id', adjust)
			.attr('name', adjust)
			.attr('for', adjust);
	}
	
	function createAutocomplete() {
		var element = $(this);
		
		element.autocomplete({
			source: element.data('options'),
			minLength: element.data('minLength') || 0,
			delay: element.data('delay') || 300
		})
	}
}(jQuery));
