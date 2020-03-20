Rails.application.routes.draw do
  root 'home#top'
  
 
  get "testkai_start/new" => "testkai_start#new" 
  get "testkai_start/index" => "testkai_start#index"
  post "testkai_start/create" => "testkai_start#create"
  
  
  get "/login" => "testkai_start_login#login_form" 
  post "/login" => "testkai_start_login#login" 
  post "logout" => "home#top"
  
  get 'testkai_end_login/login_form' => 'testkai_end_login#login_form' 
  post 'testkai_end_login/login' => 'testkai_end_login#login' 
  
  
  get 'testkai_end/index' => "testkai_end#index"
  get 'testkai_end/new' => "testkai_end#new"
  post 'testkai_end/create' => "testkai_end#create"
  
  resources :mogisupple
  
  resources :employee
  
end
