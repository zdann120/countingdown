Rails.application.routes.draw do
  devise_for :users
  resources :clocks, except: [:destroy]
  root to: 'clocks#new'
end
