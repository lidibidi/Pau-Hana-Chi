class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def create
    @bar = Bar.new (bar_params)
    if@bar.save

  end

  def new
    @bar = Bar.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

private
  def bar_params
    params.require(:bar).permit(:bar_name, :address, :city, :zipcode, :neighborhood, :phone, :website)
  end
end #the real end
