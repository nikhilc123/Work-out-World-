Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :exercises
  end
  
  get 'dashboards/index'
  root 'dashboards#index'
end
