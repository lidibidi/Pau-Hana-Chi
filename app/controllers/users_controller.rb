class UsersController < ApplicationController
before_action  :load_user, only: [:show, :edit, :update, :destroy]
# before_action :authenticate, :authorize, :only [:edit, :update, :show]

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

def authenticate
  unless logged_in?
    redirect_to root_url
  end
end

def authorize
  unless current_user == @user_id
    redirect_to root_path
  end
end

def load_user
  return @user = User.find(params[:id])
end

private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :birthdate, :email, :password, :password_confirmation)

  end
end
