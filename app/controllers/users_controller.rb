class UsersController < ApplicationController
before_action :admin_user,     only: [:destroy, :edit]
# before_action :authenticate, :authorize, :only [:edit, :update, :show]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Thanks for registering!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
      redirect_to @user
   else
     render 'edit'
   end
end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User deleted"
  redirect_to users_url
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
    params.require(:user).permit( :user_name, :birthdate, :email, :password, :password_confirmation)

  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
