class AppsController < ApplicationController

  # GET /apps or /apps.json
  def index
    @apps = App.all
    render json: @apps
  end

  # GET /apps/:token or /apps/:token.json
  def show
    @app = App.find_by(token: params[:token])
    render json: @app
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps or /apps.json
  def create
    Rails.logger.debug("App Params: #{app_params.inspect}")
    CreateAppJob.perform_async(app_params[:token], app_params[:name])
    render json: app_params[:name], status: :created
  end

  private

  def app_params
    params.permit(:name)
  end
  
end
