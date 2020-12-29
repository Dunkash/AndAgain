Rails.application.routes.draw do
  get 'home/index'
  # namespace :api do
  #   namespace :v1 do
  #
  #   end
  # end

  devise_for :users
  root to: 'home#index'
  #resources :users
  resources :user_graphs
  resources :graphs do
    resources :lines
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
