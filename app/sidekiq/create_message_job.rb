class CreateMessageJob
    include Sidekiq::Job
    queue_as :default

    def perform(app_token, chat_chat_id, message_count,body)
        puts "HERE"
        @app = App.find_by!(token: app_token)
        @chat = @app.chats.find_by!(id: chat_chat_id)
        @message = @chat.messages.new(number: message_count, body: body)
        @chat.with_lock do
            @chat.save
        end
        @message.save
        
    end
end