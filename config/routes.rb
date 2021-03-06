Rails.application.routes.draw do
  resources :projects do 
    resources :notes, except: [:index]
  end 
  
  resources :disciplines, only: [:index, :show, :new, :create]
  
  resources :users, except: [:index] do 
    resources :projects 
  end 

  root 'static#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create_with_facebook'
  post '/auth/facebook/callback', to: 'sessions#create_with_facebook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
