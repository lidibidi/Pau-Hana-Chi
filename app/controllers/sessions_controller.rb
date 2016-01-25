class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # find user by email
    user = User.find_by_email(params[:email])
    # if user exists and the password matches, save id and start their session
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :bars
    else #whomp whomp wrong password
      @message = "Your email and password combination is incorrect"
      render "new"
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice
  end

end #the real end
