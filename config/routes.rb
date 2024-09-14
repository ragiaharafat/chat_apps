Rails.application.routes.draw do
  resources :apps, params: :token do
    resources :chats, param: :chat_id do
      resources :messages
      end
    end
  root "apps#index"
  end
  # resources :messages
  # resources :create_chats
  # resources :apps
  # get "messages/index"
  # get "messages/show"
  # get "messages/new"
  # get "messages/create"
  # get "messages/edit"
  # get "messages/update"
  # get "messages/destroy"
  # get "applications/index"
  # get "applications/show"
  # get "applications/new"
  # get "applications/create"
  # get "applications/edit"
  # get "applications/update"
  # get "applications/destroy"
  # get "chats/index"
  # get "chats/show"
  # get "chats/new"
  # get "chats/create"
  # get "chats/edit"
  # get "chats/update"
  # get "chats/destroy"
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # # Defines the root path route ("/")
  # # root "posts#index"
# end
