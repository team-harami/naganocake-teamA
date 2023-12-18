Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  get 'items/index'
  get 'items/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
