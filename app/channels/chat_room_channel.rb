class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	message = ChatMessage.create!(message: data['chat_message'],
                              user_id: current_user.id,
                              chat_room_id: params['chat_room_id'])
    ActionCable.server.broadcast 'chat_room_channel',
                                  chat_message: render_message(message)
    #binding.pry
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'chat_messages/chat_message', locals: { chat_message: message })
  end
end
