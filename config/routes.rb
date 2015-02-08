Rails.application.routes.draw do
  get 'new/create'

  get 'new/destroy'

  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update,:index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
