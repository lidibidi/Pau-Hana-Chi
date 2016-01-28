class BarsController < ApplicationController

  before_action :admin_user,     only: :destroy

  # get/bars
  def index
    @bars = Bar.paginate(page: params[:page])
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
    1.times { @bar.specials.build}
  end

  # get/bars/id/edit
  def edit
    @bar = current_bar
    1.times { @bar.specials.build}
  end

  # get/bars/id
  def show
    @bar = Bar.find(params[:id])
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
    params.require(:bar).permit(:bar_name, :address, :city, :zipcode, :neighborhood, :phone, :website, :latitude, :longitude, specials_attributes:[:special_id, :special_description, :day, :special_price, :start_time, :end_time])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end #the real end
