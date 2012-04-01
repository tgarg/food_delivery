FoodDelivery::Application.routes.draw do

  root    :to => 'Pages#home'
	resources :users

	match '/signup',		:to => 'Users#new'

  match '/about',  		:to => 'Pages#about'
  match '/faq',    		:to => 'Pages#faq'
  match '/contact',		:to => 'Pages#contact'

end
