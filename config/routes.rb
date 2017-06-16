Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  resources :inventories
  resources :articles do
    put :star, on: :member
  end
  root to: "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
