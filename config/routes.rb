Rails.application.routes.draw do

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'


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
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :orders do #only: [:new, :thanks, :create, :index, :show]
      collection do
        post 'confirm'
        get 'thanks'
    end
  end
    resources :customers do
      collection do
        get :my_page, to: "customers#show"
        get "information/edit", to: "customers#edit"
        patch :information, to: "customers#update"
        get :unsubscribe
        patch :withdraw
      end
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
end