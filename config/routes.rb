Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
end
