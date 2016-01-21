class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      redirect_to root_path
    else
      render "new"
  end
end

  def destroy
    redirect_to root_url, notice
  end
  
end #the real end
