Rails.application.routes.draw do
  resources :projects do 
    resources :notes
  end 
  
  resources :disciplines
  
  resources :users do 
    resources :projects 
  end 

  root 'static#home'
  get 'about', to: 'static#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create_with_facebook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
