Rails.application.routes.draw do
  root 'dashboards#show'
  get 'dashboards/show', to: 'dashboards#show'
end
