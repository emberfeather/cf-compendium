/**
 * jQuery wait
 * 
 * Version: 0.1.0
 * 
 * Usage:
 *     jQuery.wait(1000).then(function(){ alert('Done waiting!'); });
 * 
 * Based on:
 *     http://intridea.com/2011/2/8/fun-with-jquery-deferred
 *     
 * Requires:
 *     jQuery >= 1.5
 */
(function($){
	$.wait = function(time) {
		var dfd = $.Deferred();
		
		setTimeout(function() {
			dfd.resolve();
		}, time);
		
		return dfd;
	};
}(jQuery));
