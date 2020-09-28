Rails.application.routes.draw do
  resources :notes
  resources :projects
  resources :disciplines
  resources :users

  get 'about', to: 'static#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
