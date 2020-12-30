Rails.application.routes.draw do
  root 'welcome#index'

  resources :searches
  resources :properties
end
