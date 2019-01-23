Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :bills
      resources :messages
      resources :businesses
      resources :clients
      resources :appointments
      get '/messages/user/:user_id', to: 'messages#user_messages'
      get '/bills/user/:user_id', to: 'bills#user_bills'
      get '/businesses/user/:user_id', to: 'businesses#user_biz'
      get '/clients/users/:business_id', to: 'clients#client_users'
      get '/messages/messaged-users/:user_id', to: 'messages#messaged_users'
      get '/appointments/users/:business_id', to: 'appointments#appointment_users'
      get '/clients/businesses/:client_user_id', to: 'clients#client_businesses'
    end
  end
end
