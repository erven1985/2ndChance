Rails.application.routes.draw do
  
  

	get '/users/profile' => 'users#profile'
  
	get '/search' => 'searches#index', as: 'search_path'
	
	devise_for :users, :controllers => { registrations: 'registrations' }	
  
  resources :users
  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

end

