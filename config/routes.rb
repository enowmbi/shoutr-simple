Rails.application.routes.draw do
  root 'dashboards#show'
  get 'dashboards/show', to: 'dashboards#show'

  resources :shouts, only: [:create] do
    member do 
      post 'like', to: "likes#create"
      delete 'unlike', to: "likes#destroy"
    end
  end

  resources :users, only: %i[new create show edit update]

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
end
