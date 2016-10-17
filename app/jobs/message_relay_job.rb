class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
      message: MessageController.render(message),
      chatroom_id: message.chatroom.id
    }

  end
end
