class ChatsController < ApplicationController
  # before_action :set_application
  #before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /apps/:token/chats
  def index
    @app = App.find_by("token": params[:app_token])
    if @app.nil?
      # Handle the case where the app is not found
      render json: { error: 'App not found' }, status: :not_found
    else
      @chats = @app.chats # Get all chats for the found app
      render json: @chats
    end
  end

  # GET /chats/1 or /chats/1.json
  def show
    @app = App.find_by("token": params[:app_token])
    @chat = @app.chats.find_by!(id: params[:chat_id])
    if @chat.nil?
      Rails.logger.debug("Chat not found with ID: #{params[:chat_id]} in app with token: #{params[:app_token]}")
      render json: { error: 'Chat not found' }, status: :not_found
      return
    end
    render json: @chat
  end

  # GET /chats/new
  def new
    @chat = @app.chats.build
  end

  # POST /chats or /chats.json
  def create
    @app = App.find_by!("token": params[:app_token])

    chat_number = next_chat_number(@app.token)
    $redis.set("#{params[:app_token]}_#{chat_number}_next_message_num", 1)
    CreateChatJob.perform_async(params[:app_token], chat_number)

    render json: {number: chat_number, messages_count: 0}, status: :created
    
  end

  def destroy
    @app = App.find_by!(token: params[:app_token])
    chat = @app.chats.find_by!(id: params[:id])
    if chat.destroy
      render json: { message: 'Chat successfully deleted' }, status: :ok
    else
      render json: { error: 'Failed to delete chat' }, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def chat_params
      params.permit(:number)
    end

    def next_chat_number(app_token)
      redis_key = "#{app_token}_next_chat_number"
      $redis_lock.lock(redis_key, 2000) do
        current_number = $redis.get(redis_key).to_i
        next_number = current_number + 1
        $redis.set(redis_key, next_number)
        puts "NEXT_NUMBER: #{next_number}"
        return next_number
      end
    end
end
