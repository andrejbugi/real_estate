Rails.application.routes.draw do
  root 'properties#index'
  
  resources :searches
  resources :properties
end
