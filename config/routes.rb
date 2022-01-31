Rails.application.routes.draw do
  root 'dashboards#show'
  get 'dashboards/show', to: 'dashboards#show'

  resources :users, only: %i[new create show edit update]
end
