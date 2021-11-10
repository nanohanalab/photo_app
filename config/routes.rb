Rails.application.routes.draw do
  root to: 'sessions#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :photos, only: [:index, :new, :create]

  get    '/oauth/callback',   to: 'twitter#callback'
  get    'tweet',             to: 'twitter#tweet'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
