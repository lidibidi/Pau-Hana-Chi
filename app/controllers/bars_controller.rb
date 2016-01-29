class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update]
  before_action :admin_user,     only: :destroy

  # get/bars
  def index
    @bars = Bar.paginate(page: params[:page])
    @hash = Gmaps4rails.build_markers(@bars) do |bar, marker|
      marker.lat bar.latitude
      marker.lng bar.longitude
      marker.infowindow bar.bar_name
      marker.picture( {
        "url": "http://i.imgur.com/dNVi4Xq.png",
        "width":  32,
        "height": 32})
    end
  end

# post/bars
  def create
    @bar = Bar.new bar_params
    if @bar.save
      flash[:success] = ('Bar was added to Pau Hana Chi!')
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
  end

  # get/bars/id
  def show
    @bar = Bar.find(params[:id])
    @specials = current_bar.specials
  end

# patch/put/bars/1
  def update
    @bar = current_bar
    @specials =current_bar.specials
    if @bar.update_attributes(bar_params)


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
    flash[:success] = "Bar Deleted"
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
