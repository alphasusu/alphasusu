socket = null

$ ->
	if $('.chat-window').length
		initChat()
	else
		initHelpIndex()
	for i in [1...50]
		insertChatMessage "Hello, world", "Dan Palmer", false


initHelpIndex = ->
	$('.chat-button').each (idx, value) ->
		group = $(value).attr('data-chat-id')
		checkOnline group, (online) ->
			if online
				enableChat value, group
			else
				disableChat value, group

initChat = ->
	# socket = io.connect('ws://152.78.158.249:3000/')
	# socket.on 'news', (data) ->
	# 	alert data
	# socket.emit 'news', 'foo'
	$('.chat-form').submit ->
		insertChatMessage 'foo', 'bar'
		return false

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

insertChatMessage = (message, from, animated = true) ->
	entry = "<li><strong>#{from}</strong> &ndash; #{message}</li>"
	if animated
		$(entry).hide().appendTo($('.chat-window ul')).fadeIn(300)
	else
		$(entry).appendTo($('.chat-window ul'))
	chat = $('.chat-window')
	chatHeight = chat[0].scrollHeight
	if animated
		chat.animate({ scrollTop: chatHeight }, 1000)
	else
		chat.scrollTop(chatHeight)
