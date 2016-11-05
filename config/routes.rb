Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for :users, controllers: {omniauth_callbacks:"users/callbacks", registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users, only: [:show]

  resources :courses, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :tasks, only: [:create, :update, :destroy] 
  resources :cheers, only: [:create, :destroy]
  
end
