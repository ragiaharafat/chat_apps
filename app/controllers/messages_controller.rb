class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    app = App.find_by!(token: params[:app_id])
    chat = app.chats.find_by!(id: params[:chat_id]) 
    @messages = chat.messages
    render json: @messages, :except=> [:id, :chat_id], status: :created
  end

  # GET /messages/1 or /messages/1.json
  def show
    app = App.find_by!(token: params[:app_id])
    chat = app.chats.find_by!(id: params[:chat_id]) 
    @message = chat.messages.find(params[:id])
    render json: @message, :except=> [:id, :chat_id], status: :created
  end

  # POST /messages or /messages.json
  def create
    @app = App.find_by!(token: params[:app_id])
    next_mesg_num = next_message_number(params[:app_id], params[:chat_id])
    CreateMessageJob.perform_async(params[:app_id], params[:chat_id], next_mesg_num, message_params[:body])
    render json: {number: next_mesg_num, message: params[:body]}, :except=> [:id, :chat_id], status: :created
  end

  # def search
  #   if params[:q].present?
  #     puts "Query: #{params[:q]}"
  #     @messages = Message.search(params[:q]).records.to_a
  #     puts "Search results: #{@messages}"
  #   else
  #     @messages = Message.all
  #   end
  #   render json: @messages.as_json(except: [:id])
  # end
  
  def search
    # @result = Message.search(params[:message])
    # render json: @result, :except=> [:id, :chat_id], status: :ok
    query = params[:query]
    if query.present?
      @result = Message.search(query) # Adjust this line based on your Elasticsearch setup
      render json: @result, except: [:id, :chat_id], status: :ok
    else
      render json: { error: 'Query parameter missing' }, status: :bad_request
    end
  end


  private

  def search_params
    params.permit(:query, :q)
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.where(chat_id: params[:chat_id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.permit(:body, :app_id ,:chat_id)
  end

  def next_message_number(app_id,chat_id)
    redis_key = "#{app_id}_#{chat_id}_next_msg_num"
    $redis_lock.lock(redis_key, 2000) do
      current_number = $redis.get(redis_key).to_i
      next_number = current_number + 1
      $redis.set(redis_key, next_number)
      return next_number
    end
  end

end
