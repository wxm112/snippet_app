Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update]

end
