Rails.application.routes.draw do

  
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  scope module: :public do
    resources :orders do #only: [:new, :thanks, :create, :index, :show]
      collection do
        get 'confirm'
        get 'thanks'
      end
    end
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

end
