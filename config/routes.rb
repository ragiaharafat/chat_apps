Rails.application.routes.draw do
  resources :apps, params: :token do
    resources :chats, params: :chat_id ,only: [:index, :show, :create]  do
      resources :messages
        # collection do
        #   post 'search', to: 'messages#search'
        # end
      # end
    end
  end
root "apps#index"
end