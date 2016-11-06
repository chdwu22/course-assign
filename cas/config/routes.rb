Rails.application.routes.draw do
  root to: "pages#home"
  
  resources :users
  
  get 'admins' => 'admins#index'
end
