Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit,:update]
<<<<<<< Updated upstream
  resources :groups, only: [:new, :create, :edit, :update]
=======
  resources :groups
>>>>>>> Stashed changes
end
