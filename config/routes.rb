Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :bills
      resources :messages
      resources :businesses
      get '/messages/user/:user_id', to: 'messages#user_messages'
      get '/bills/user/:user_id', to: 'bills#user_bills'
      get '/businesses/user/:user_id', to: 'businesses#user_biz'
    end
  end
end
