class CreateChatJob
    include Sidekiq::Job 
    queue_as :default
    
    def perform(app_token, chat_number)
        puts  "???????????????", app_token
        @app = App.find_by!("token": app_token)
    
        @chat = @app.chats.new(number: chat_number)
        @chat.save
        
        # if @chat.save
        #     puts "HEREEEEEEEEEEEEEEEE"
        #     Rails.logger.info "Chat #{chat_number} created successfully."
        #     @app.with_lock do
        #         @app.save
        #     end
        # else
        #     Rails.logger.error "Failed to create chat #{chat_number}: #{chat.errors.full_messages.join(', ')}"
        # end
    end

end