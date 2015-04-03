Rails.application.routes.draw do
    
    root 'lessons#index' 
    resources :lessons
    resources :users

    post 'lessons/submit', to: 'lessons#submit' 
end
