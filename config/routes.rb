Rails.application.routes.draw do
  resources :projects do 
    resources :notes
  end 
  
  resources :disciplines do 
    resources :projects, only: [:index]
  end 
  
  resources :users do 
    resources :projects 
  end 

  get 'about', to: 'static#about'
  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
