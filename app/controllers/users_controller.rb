class UsersController < ApplicationController

  def index
    render :new_user_form
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      redirect_to '/new'
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(session[:id])
    
    if @user.update(user_params)
      redirect_to '/dashboard'
    else
      render :edit
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end


end
