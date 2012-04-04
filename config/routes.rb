FoodDelivery::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root    :to => 'Pages#home'
  
	match '/signup',		:to => 'Users#new'
	
	match '/signin',    :to => 'sessions#new'
	match '/signout',   :to => 'sessions#destroy', via: :delete 

  match '/about',  		:to => 'Pages#about'
  match '/faq',    		:to => 'Pages#faq'
  match '/contact',		:to => 'Pages#contact'

end
