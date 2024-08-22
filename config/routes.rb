Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/home", to: "home#index"

  get '/article/:slug', to: 'articles#show'
  get 'edit/:slug', to: 'articles#edit', as: 'article'
  get 'user/:id', to: 'users#show'
  get 'login', to: 'users#login', as: 'login'
  post 'login', to: 'users#login'

  resources :articles do
    member do
      delete 'remove_tag/:tag_id', to: 'articles#remove_tag', as: :remove_tag
    end
  end

  root "home#index"
end