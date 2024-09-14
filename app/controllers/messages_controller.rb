class MessagesController < ApplicationController
  before_action :set_chat
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
    render json: @messages
  end

  # GET /messages/1 or /messages/1.json
  def show
    # @message = @chat.messages.find(params[:id])
    # render json: @message
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @message.chat = Chat.find(params[:chat_id])
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      # @message = Message.find(params[:id])
      @message = Message.where(chat_id: params[:chat_id])
    end

    def set_chat
      @chat = Chat.find_by!(id: params[:number], app: App.find_by!(token: params[:app_id]))
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:body)
    end
end
