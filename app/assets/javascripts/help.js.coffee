$ ->
	$('.chat-button').each (idx, value) ->
		group = $(value).attr('data-chat-id')
		checkOnline group, (online) ->
			if online 
				enableChat value, group
			else
				disableChat value, group

checkOnline = (group, callback) ->
	callback (Math.random() > 0.5)

enableChat = (button, group) ->
	$(button)
		.removeClass('disabled')
		.html('Chat Now')
		.attr('href', '/help/chat?group=' + group)

disableChat = (button, group) ->
	$(button)
		.addClass('disabled')
		.html('Offline')
		.attr('href', '#')
