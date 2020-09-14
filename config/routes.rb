Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  get 'homes/top', to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show]
end
