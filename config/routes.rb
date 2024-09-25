Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/new'
  get 'reviews/show'
  get 'reviews/show'
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # read (all)
  get 'restaurants', to: 'restaurants#index'

  # create
  get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
  post 'restaurants', to: 'restaurants#create'

  # read (one)
  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  Rails.application.routes.draw do
    resources :restaurants do
      resources :reviews
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
