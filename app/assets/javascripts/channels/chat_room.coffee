document.addEventListener 'turbolinks:load', ->
  chat_room_id = $('#chat_messages').data('chat_room_id')
  App.chat_room = App.cable.subscriptions.create { channel: "ChatRoomChannel", chat_room_id: chat_room_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
        $('#chat_messages').prepend(data['chat_message'])
        # Called when there's incoming data on the websocket for this channel

    speak: (chat_message) ->
      @perform 'speak', chat_message: chat_message

    $(document).on 'keypress', '[data-behavior~=chat_room_speaker]', (event) ->
      if event.keyCode is 13
        App.chat_room.speak event.target.value
        event.target.value = ''
        event.preventDefault()