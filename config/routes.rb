Rails.application.routes.draw do
  
  root 'home#top'
  resources :mogisupple
  
  resources :employee
  
  get "testkai/new" => "testkai#new" 
  get "testkai/index" => "testkai#index"
  post "testkai/create" => "testkai#create"
  
  
  get "/login" => "employees#login_form" 
  post "/login" => "employees#login" 
  post "logout" => "employees#logout"
end
