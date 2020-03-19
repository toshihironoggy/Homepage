Rails.application.routes.draw do
  
  
  root 'home#top'
  resources :mogisupple
  
  resources :employee
  
  get "testkai_start/new" => "testkai_start#new" 
  get "testkai_start/index" => "testkai_start#index"
  post "testkai_start/create" => "testkai_start#create"
  
  
  get "/login" => "testkai_start_login#login_form" 
  post "/login" => "testkai_start_login#login" 
  post "logout" => "testkai_start_login#logout"
end
