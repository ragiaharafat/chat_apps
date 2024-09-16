Rails.application.routes.draw do
  resources :apps, param: :token, only: [:index, :show, :create, :destroy] do
    resources :chats, param: :chat_id, only: [:index, :show, :create, :destroy] do
      resources :messages, only: [:index, :show, :create, :destroy]
        # collection do
        #   post 'search', to: 'messages#search'
        # end
      # end
    end
  end
root "apps#index"
end