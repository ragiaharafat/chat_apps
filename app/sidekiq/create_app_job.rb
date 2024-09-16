class CreateAppJob 
  include Sidekiq::Job
  queue_as :default

  def perform(app_token, app_name)
    @app = App.new(token: app_token, name: app_name)
    @app.save
    $redis.set("#{app_token}_next_chat_num", 1)
  end
end
