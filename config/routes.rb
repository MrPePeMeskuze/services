Rails.application.routes.draw do
	resources :services,  only: [:show, :edit, :new, :update, :destroy]
	resources :users
	resources :static_pages
	resources :sessions, only: [:new, :create, :destroy]
	root  'static_pages#home'
	get 'home' , to: 'static_pages#home'
	get 'about' , to: 'static_pages#about'
	get 'contacts' , to: 'static_pages#contacts'
	get 'admin_services' , to: 'services#index'
	get 'services' , to: 'static_pages#services'
	get 'news' , to: 'static_pages#news'
	get 'portfolio' , to: 'static_pages#portfolio'
	post'sendmail' , to: 'static_pages#sendmail'
	get 'new' , to: 'users#new'
	get '/signin',  to: 'sessions#new',         via: 'get'
  	match '/signout', to: 'sessions#destroy', via: 'delete'
end
