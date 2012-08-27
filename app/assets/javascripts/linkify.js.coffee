$(document).ready ->
	$('a#copy-link').zclip {
		path: '/ZeroClipboard.swf',
		copy: $('span#link').text(),
		afterCopy: -> 
		  text = $(this).text()
		  queueFunction = (n) -> $(this).text(text); n()
		  $(this).text('Copied!').delay(800).queue( queueFunction )
	}
