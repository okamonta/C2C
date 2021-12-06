Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :user do
    root to: 'homes#top'
    get 'homes/contact' => 'homes#contact'
    get '/search' => 'searches#search'
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
    end
    resources :videos, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
    end
    resources :informations, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :videos, only: [:index, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :show, :create, :edit, :update]
    resources :statuses, only: [:index, :show, :create, :edit, :update]
    resources :informations, only: [:index, :show, :edit, :update, :destroy]
  end
  
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

end