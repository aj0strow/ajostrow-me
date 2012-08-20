$(document).ready ->
	$('a#copy-link').zclip {
		path: '/ZeroClipboard.swf',
		copy: $('span#link').text(),
		afterCopy: -> alert('Copied!')
	}
