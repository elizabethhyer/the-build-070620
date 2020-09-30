Rails.application.routes.draw do
  resources :projects do 
    resources :notes
  end 
  
  resources :disciplines
  
  resources :users do 
    resources :projects 
  end 

  get 'about', to: 'static#about'
  root 'static#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
