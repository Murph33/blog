Rails.application.routes.draw do

  root "home#index"
  get "/home/about" => "home#about"

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  resources :users, only: [:new, :create] do
    resources :favourites, only: [:index]
    get :edit, on: :collection
    patch :update, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :posts do
    resources :favourites, only: [:destroy, :create]
    resources :comments
  end

end
