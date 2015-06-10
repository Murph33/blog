Rails.application.routes.draw do

  root "home#index"
  get "/home/about" => "home#about"
  
  resources :posts do
    resources :comments
  end

end
