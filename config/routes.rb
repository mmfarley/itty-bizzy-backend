Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :bills
      resources :messages
      resources :businesses
      resources :clients
      get '/messages/user/:user_id', to: 'messages#user_messages'
      get '/bills/user/:user_id', to: 'bills#user_bills'
      get '/businesses/user/:user_id', to: 'businesses#user_biz'
      get '/clients/users/:business_id', to: 'clients#client_users'
    end
  end
end
