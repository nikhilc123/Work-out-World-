Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  
  get 'dashboards/index'
  root 'dashboards#index'
  
  resources :users do
    resources :exercises
  end
  
  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end
  
 
end
