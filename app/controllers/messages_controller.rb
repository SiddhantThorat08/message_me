class MessagesController < ApplicationController
before_action :require_user

    def create
        message = current_user.messages.build(message_params)
        if message.save
        #ActionCable.server.broadcast "chatroom_channel", foo: message.body
        ActionCable.server.broadcast("chatroom_channel", { content: message_render(message) })
        end
    end


    private
    def message_params
        params.require(:message).permit(:body)
    end
    
    #this mehod renders the message partial  via controller and give the message object to partial through :locals
    def message_render(message)
        render(partial: 'message',locals: {message: message})
    end
end