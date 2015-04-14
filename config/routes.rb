Rails.application.routes.draw do
    
  devise_for :users
  root 'lessons#index' 

  # Limit lessons action to index and show for the time being
  resources :lessons, only: [:index, :show]
  resources :users, only: [:show]

  post 'lessons/submit', to: 'lessons#submit' 
end
