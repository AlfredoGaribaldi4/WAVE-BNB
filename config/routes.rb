Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :boards do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
    get 'accept', to: "bookings#accept"
    get 'decline', to: "bookings#decline"
  end
end
