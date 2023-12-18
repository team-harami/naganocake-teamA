Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_cart'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end


  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

end
