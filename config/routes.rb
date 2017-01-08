Rails.application.routes.draw do
  resources :clients do
  	collection do
  		get 'running'
  	end
  end
  resources :advocates
  resources :case_files do
  	collection do
  		get 'completed'
  		get 'upcoming'
  	end
  end
  get '/', to: 'dashboard#index', as: 'dashboard'
  get '/search', to: 'dashboard#search', as: 'search'
end
