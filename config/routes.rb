Rails.application.routes.draw do
  
  

	get '/users/profile' => 'users#profile'
  
	get '/search' => 'searches#index', as: 'search'
	
	devise_for :users, :controllers => { registrations: 'registrations' }	
  
	get '/messages/new/:user_id'    => 'messages#new', as: 'new_message'
	post '/messages/new/:user_id'    => 'messages#create'

  resources :users
  resources :places
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

end

