FoodDelivery::Application.routes.draw do
  resources :users
  
  root    :to => 'Pages#home'
  
	match '/signup',		:to => 'Users#new'

  match '/about',  		:to => 'Pages#about'
  match '/faq',    		:to => 'Pages#faq'
  match '/contact',		:to => 'Pages#contact'

end
