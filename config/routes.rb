FoodDelivery::Application.routes.draw do

  get "users/new"

  root    :to => 'Pages#home'

  match '/about',  		:to => 'Pages#about'
  match '/faq',    		:to => 'Pages#faq'
  match '/contact',		:to => 'Pages#contact'

end
