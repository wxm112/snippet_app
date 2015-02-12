Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :edit, :show, :update,:index]
  resources :groups
  resources :snippets, :only => [:edit, :show, :update, :index, :destroy]

  get '/users/:id/confirm/:confirmation_code' => 'users#active', as: :active_account

  get '/snippets/:id/share' => 'snippets#share', as: :share_snippet
  post '/snippets/:id/add_to_group' => 'snippets#add_to_group', as: :send_snippet

  get  '/groups/:id/add_group_snippet' => 'groups#add', as: :add_group_snippet
  post '/groups/:id/snippets' => 'snippets#create', as: :save_group_snippet
  get '/groups/:id/add_user_to_group' => 'groups#add_user_to_group', as: :add_user
  get '/groups/:id/choose_user_to_group' => 'groups#choose_user_to_group', as: :choose_user
  get '/groups/:id/save_user_to_group/:user_id' => 'groups#save_user_to_group', as: :save_user
  

  get 'api/v1/snippets/:id' =>'json#show', :as => :json_snippet

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
