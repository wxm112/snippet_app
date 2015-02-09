Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update,:index]
  resources :snippets

  get '/snippets/json/:id' =>'json#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
