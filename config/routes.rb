Rails.application.routes.draw do
  get 'json/show'

  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update,:index]
  resources :snippets

  get '/snippets/json/:name' =>'json#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
