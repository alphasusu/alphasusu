#= require socket.io
# socket = new io.Socket()
socket = null
userName = "Anonymous"

#####
## Initialisers
#####

window.initHelpIndex = (server) ->
	$.getJSON server + 'online', (online) ->
		$('.chat-button').each ->
			disableChat $(this)
		$.each online, (idx, value) ->
			enableChat $('[data-chat-id="' + value + '"]')

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

enableChat = (button) ->
	$(button)
		.removeClass('disabled')
		.html('Chat Now')
		.attr('href', '/help/chat?group=' + $(button).attr('data-chat-id'))

disableChat = (button) ->
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
	$('.chat .selection').css('display', 'none')
	$('.chat .online').css('display', 'block')

window.setUserName = (newName) ->
	userName = newName
