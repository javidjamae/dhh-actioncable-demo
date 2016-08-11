# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create! content: data['message']
    #ActionCable.server.broadcast 'room_channel', message: render(message)
  end

  private

    def render(message)
      #message
      foo = ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: { message: message }
      )
      logger.info("FOO: #{foo}")
      foo
    end
end
