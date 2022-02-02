Rails.application.routes.draw do
  root 'dashboards#show'
  get 'dashboards/show', to: 'dashboards#show'

  resources :shouts, only: [:create] do
    member do 
      post 'like', to: "likes#create"
      delete 'unlike', to: "likes#destroy"
    end
  end

  resources :users, only: %i[new create show edit update] do
    member do
      post 'follow', to: "followed_users#create"
      post 'unfollow', to: "followed_users#destroy"
    end
  end

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
end
