Rails.application.routes.draw do
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	root  'static_pages#home'
	get 'home' , to: 'static_pages#home'
	get 'about' , to: 'static_pages#about'
	get 'contacts' , to: 'static_pages#contacts'
	get 'new' , to: 'users#new'
	get '/signin',  to: 'sessions#new',         via: 'get'
  	get '/signout', to: 'sessions#destroy',     via: 'destroy'
end
