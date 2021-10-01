Rails.application.routes.draw do
  
  #google map表示
  #root to: 'maps#index'
  #root to: 'shops#index'
  
  root to: 'mogisupple#index'
  get 'maps/index' =>'maps#index'
  #↓これがないとNo routes match [POST] "/"がでる
  post "/" => "maps#update"
  
  resources :maps
  #devise_for :users
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  #get 'pages/index'
  #root 'pages#index'
  get 'pages/show'
  
  #root "home#index"
  #get 'home/:id' => "home#show"
  
  get 'slide/index' => "slide#index"
  get 'slide/:id' => "slide#show"
  #get 'mogisupple/index' => "mogisupple#index"
  #get 'mogisupple/:id' => mogisupple#show"
  resources :mogisupple
   
  get "testkai_start/new" => "testkai_start#new" 
  get "testkai_start/index" => "testkai_start#index"
  post "testkai_start/create" => "testkai_start#create"
  
  get "/login" => "testkai_start_login#login_form" 
  post "/login" => "testkai_start_login#login" 
  post "logout" => "testkai_start_login#login_form" 
  
  get 'testkai_end_login/login_form' => 'testkai_end_login#login_form' 
  post 'testkai_end_login/login' => 'testkai_end_login#login' 
  post 'testkai_end_login/logout' => 'testkai_end_login#login_form' 
  
  get 'testkai_end/index' => "testkai_end#index"
  get 'testkai_end/new' => "testkai_end#new"
  post 'testkai_end/create' => "testkai_end#create"
  
  resources :employee
  resources :users, :only => [:show]
 
end
