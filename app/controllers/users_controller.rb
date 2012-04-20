class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Duke Delivery!"
      redirect_to @user
    else
      render 'new'
    end 
  end
end

private
  
  # This method can be used to define a before filter for certain actions. May need to move it into a helper file
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
