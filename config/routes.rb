Rails.application.routes.draw do

  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#register'

  get 'test', to: 'users#test'
  get '/users/:id', to: 'users#show'

  namespace :api do
    namespace :v1 do
      resources :categories
      resources :expenses
    end
  end
end
