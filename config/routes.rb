Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: %i[new create]
    collection do
      get :top
    end
    member do
      get :chef
    end
  end
  resources :reviews, only: %i[destroy edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
