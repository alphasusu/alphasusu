#= require socket.io
# socket = new io.Socket()
socket = null
userName = "Anonymous"

#####
## Initialisers
#####

window.initHelpIndex = ->
	$('.chat-button').each (idx, value) ->
		group = $(value).attr('data-chat-id')
		checkOnline group, (online) ->
			if online
				enableChat value, group
			else
				disableChat value, group

window.initChat = (server, room, agent = false) ->
	$('.chat-form').submit ->
		sendMessage $('.chat-input').val()
		$('.chat-input').val('')
		return false
	socket = io.connect(server)
	socket.on 'connect', ->
		socket.emit 'join', { room: room }
		socket.on 'message', (data) ->
			insertChatMessage data.message, data.from
	if agent
		socket.emit 'message', { from: 'System', message: 'You are now chatting with ' + userName }
	else
		socket.emit 'message', { from: 'System', message: 'Connecting you to a support representative.' }

window.initSupport = (server) ->
	$.getJSON server, (response) ->
		socket = io.connect(server)
		socket.on 'connect', ->
			socket.on 'request', (data) ->
				newChatWindow data.chat_id
			socket.emit 'join', { room: response.room }


#####
## Helper Methods
#####

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

sendMessage = (message) ->
	socket.emit 'message', { message: message, from: userName }

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

newChatWindow = (chatId) ->
	console.log chatId
	w = window.open('/help/agent?chat_id=' + chatId, 'Support','directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=no,resizable=no,width=400,height=500')

window.setSupportChannel = (group) ->
	socket.emit 'support', { group: group }

window.setUserName = (newName) ->
	userName = newName
