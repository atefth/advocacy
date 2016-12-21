Rails.application.routes.draw do
  resources :clients
  resources :advocates
  resources :case_files
  get '/', to: 'dashboard#index', as: 'dashboard'
end
