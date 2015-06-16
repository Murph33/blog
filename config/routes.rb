Rails.application.routes.draw do

  root "home#index"
  get "/home/about" => "home#about"

  resources :users, only: [:new, :create] do
    get :edit, on: :collection
    patch :update, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :posts do
    resources :comments
  end

end
