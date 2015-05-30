Rails.application.routes.draw do
	root  'static_pages#home'
	get 'home' , to: 'static_pages#home'
	get 'about' , to: 'static_pages#about'
	get 'contacts' , to: 'static_pages#contacts'
	get 'signup', to: 'users#create'
end
