Rails.application.routes.draw do
  resources :important_dates
  resources :notes
  resources :interactions
  resources :friends
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
