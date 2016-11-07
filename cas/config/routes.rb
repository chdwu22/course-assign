Rails.application.routes.draw do
  root to: "pages#home"
  
  resources :users
  
  get 'admins' => 'admins#index'
  
  get 'login' => 'users#login'
  get 'signup' => 'users#signup'
end
