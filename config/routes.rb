Rails.application.routes.draw do
	resources :users
	root  'static_pages#home'
	get 'home' , to: 'static_pages#home'
	get 'about' , to: 'static_pages#about'
	get 'contacts' , to: 'static_pages#contacts'
	get 'new' , to: 'users#new'
end
