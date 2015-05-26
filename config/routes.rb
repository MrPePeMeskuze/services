Rails.application.routes.draw do

  get 'home' , to: 'static_pages#home'

  get '/' , to: 'static_pages#home'

  get 'about' , to: 'static_pages#about'

  get 'contacts' , to: 'static_pages#contacts'

end
