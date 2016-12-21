Rails.application.routes.draw do
  resources :clients
  resources :advocates
  resources :case_files
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
