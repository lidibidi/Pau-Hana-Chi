class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      render 'new'
  end
end

private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :birthdate, :email, :password, :password_confirmation)

  end
end
