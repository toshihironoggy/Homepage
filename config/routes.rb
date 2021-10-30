Rails.application.routes.draw do
  
  #google map表示
  #root to: 'maps#index'
  #root to: 'shops#index'
  
  
  
  get 'maps/index' =>'maps#index'
  #↓これがないとNo routes match [POST] "/"がでる
  #post "/" => "maps#update"
  
  resources :maps
  #devise_for :users
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  #deviseのログイン画面をrootに設定
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  get 'pages/show'
  
  #root "home#index"
  #get 'home/:id' => "home#show"
  
  get 'slide/index' => "slide#index"
  get 'slide/:id' => "slide#show"
  
  get 'mogisupple/index' => "mogisupple#index"
  get 'mogisupple/:id' => "mogisupple#show"
  
  #resources :mogisupple
   
  resources :users, :only => [:show]
  
  resources :events
 
end
