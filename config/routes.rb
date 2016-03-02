Rails.application.routes.draw do
  get 'dashboards/index'
  root 'dashboards#index'
end
