Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'home#index'

  resources :questions, shallow: true do
    resources :answers, only: [:create, :destroy] do
      resources :votes, only: [:create,:update,:destroy]
    end

    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]


end
