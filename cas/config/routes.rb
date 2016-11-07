Rails.application.routes.draw do
  root to: "pages#home"
  
  resources :users, :faculties
  
  get 'admins' => 'admins#index'
  
  get 'signup' => 'users#signup'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
