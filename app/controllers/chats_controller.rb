class ChatsController < ApplicationController
  before_action :set_application
  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /apps/:token/chats
  def index
    @chats = @app.chats.all
    # @chats = Chat.where(app_id: @app.token)
    render json: @chats
  end

  # GET /chats/1 or /chats/1.json
  def show
    render json: @chat
  end

  def set_application
    puts token
    @app = App.find_by!(token: params[:token])
  end

  # GET /chats/new
  def new
    @chat = @app.chats.build
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    # @app = App.find(params[:app_id]) # Find the application by ID or token
    @chat = @app.chats.new(chat_params)
    @chat.number = next_chat_number

    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_url(@chat), notice: "Create chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Create chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Create chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_chat
    #   @chat = @app.chats.find(params[:chat_id])
    # end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:chat_id, :number)
    end

    def next_chat_number
      @app.chats.maximum(:number).to_i + 1
    end
end
