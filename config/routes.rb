Rails.application.routes.draw do
    
  devise_for :users
    root 'lessons#index' 
    resources :lessons
    resources :users

    post 'lessons/submit', to: 'lessons#submit' 
end
