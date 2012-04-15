class RestaurantsController < ApplicationController
  def new
    # this action should be protected so that only users with admin=true can axx
		@restaurant = Restaurant.new
  end

  def create
    # this action should be protected so that only users with admin=true can axx
		@restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
     flash.now[:success] = "Restaurant added!"
     render 'new'
    else
    render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
