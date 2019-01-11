Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :bills
      resources :messages
      resources :businesses
    end
  end
end
