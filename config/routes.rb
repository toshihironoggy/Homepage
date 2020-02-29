Rails.application.routes.draw do
  
  get 'schools/index'
  get 'employees/index'
  get "users/index"
  
  #root 'home#top'
  #root 'employees#login_form'
  
  # devise_for :users
  get "pages/index" => "pages#index"
  get "pages/show" => "pages#show"

  get "testkai/index" => "testkai#index"
  get "testkai/new" => "testkai#new"
  post "testkai/create" => "testkai#create"

  #get "login" => "employees#login_form"
  post "login" => "employees#login"
  post "logout" => "employees#logout"

  
  root "movies#index"
  resources :movies
  # get "movies/:id" => "movies#show"
  
  

end
