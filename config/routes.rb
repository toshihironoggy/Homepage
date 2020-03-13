Rails.application.routes.draw do
  
  root 'home#top'
  
  # devise_for :users
  get "pages/index" => "pages#index"
  get "pages/show" => "pages#show"
  
  get 'schools/index'
  get "users/index"
  get "testkai/index" => "testkai#index"
  get "testkai/new" => "testkai#new"
  post "testkai/create" => "testkai#create"

  get "login" => "employees#login_form"
  post "login" => "employees#login"
  post "logout" => "employees#logout"

  resources :movies
  resources :employees
  
  

end
