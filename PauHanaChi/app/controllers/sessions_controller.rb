class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path (user)
    else
      @message = "Your email and password combination is incorrect"
      render "new"
  end
end

  def destroy
    redirect_to root_url, notice
  end

end #the real end
