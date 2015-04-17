Rails.application.routes.draw do
    
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'lessons#index' 

  # Limit lessons action to index and show for the time being
  resources :lessons, only: [:index, :show]
  #resources :users

  post 'lessons/submit', to: 'lessons#submit' 
end
