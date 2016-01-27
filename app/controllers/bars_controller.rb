class BarsController < ApplicationController

  before_action :admin_user,     only: :destroy

  # get/bars
  def index
    @bars = Bar.all
  end
# post/bars
  def create
    @bar = Bar.new bar_params
    if @bar.save
      flash[:success] = ['Bar was added to Pau Hana Chi!']
      redirect_to bars_path
      else
        render :new
    end
  end

  # get/bar/new
  def new
    @bar = Bar.new
  end

  # get/bars/id/edit
  def edit
    @bar = current_bar
  end

  # get/bars/id
  def show
    @bar = current_bar
  end

# patch/put/bars/1
  def update
    @bar = current_bar
    if @bar.update_attributes(params[:bar])
      flash[:success] = "Bar updated"
      redirect_to @bar
    else
      render 'edit'
  end
end
# delete/bars/id
  def destroy
    @bar = current_bar
    @bar.destroy
    flash[:success] = "Bar deleted"
    redirect_to bars_path
  end

#bars latitude and longitude
  def bar_lat_long
    @barslatlong = [params[:latitude],params[:longitude]].join(",")
  end

private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def current_bar
    @current_bar || Bar.find(params[:id]) if params[:id]
  end

  def bar_params
    params.require(:bar).permit(:bar_name, :address, :city, :zipcode, :neighborhood, :phone, :website, :latitude, :longitude)
  end
end #the real end
