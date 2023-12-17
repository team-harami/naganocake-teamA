Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get 'about' => 'homes#about'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_cart'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create]

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
end
