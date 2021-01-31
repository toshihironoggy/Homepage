Rails.application.routes.draw do
  
  devise_for :users
  #get 'pages/index'
  #get 'pages/show'
  root 'pages#index'
  get 'pages/show'
  
  #root "home#index"
  get 'home/:id' => "home#show"
  
  get 'slide/index' => "slide#index"
  get 'slide/:id'   => "slide#show"
  
 
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
  
 
  
  
end
