Rails.application.routes.draw do
  
  root 'home#top'
  
  # devise_for :users
  get "pages/index" => "pages#index"
  get "pages/show" => "pages#show"
  
  #school-----------------------
  get 'schools/index'
  
  get "users/index"
  
  get "testkai/index" => "testkai#index"
  get "testkai/new" => "testkai#new"
  post "testkai/create" => "testkai#create"
  
  resources :employees
  get "login" => "employees#login_form"
  post "login" => "employees#login"
  post "logout" => "employees#logout"

  resources :movies
  
  

end
