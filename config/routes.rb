Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :recipes
      resources :favorites
      resources :comments
      resources :users
      get '/login', to: 'users#login', as: "login"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
