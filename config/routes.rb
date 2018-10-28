Rails.application.routes.draw do

  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#register'

  get 'test', to: 'users#test'
  get '/users/:id', to: 'users#show'
  post '/user/:id/show_bill_shares', to: 'users#show_bill_shares'
  post '/user/:id/update_bill_shares', to: 'users#update_bill_shares'
  post '/user/:id/friend_request', to: 'users#friend_request'
  post '/user/:id/accept_request', to: 'users#accept_request'
  post '/user/:id/reject_request', to: 'users#reject_request'

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index]
      resources :expenses
    end
  end
end
