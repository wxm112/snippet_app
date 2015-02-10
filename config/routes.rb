Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update,:index]
  resources :groups
  resources :snippets

  get '/snippets/:id/share' => 'snippets#share', as: :share_snippet
  post '/snippets/:id/add_to_group' => 'snippets#add_to_group', as: :send_snippet

  get 'api/v1/snippets/:id' =>'json#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
