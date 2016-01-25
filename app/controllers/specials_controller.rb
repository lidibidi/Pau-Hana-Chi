class SpecialsController < ApplicationController

  def index
    @specials = Special.all
  end

  def create
  end

  def new
    @special = Special.new
  end

  def edit
  end

  def show
    @user = User.find(params[:user_id])
  end

  def update
  end

  def destroy
  end

  def special_params
    params.require(:day, :special_description, :special_price, :start_time, :end_time)

  end
end # the real end
