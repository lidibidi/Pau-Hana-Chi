class SpecialsController < ApplicationController
before_action :admin_user,     only: [:destroy, :edit]
#get/specials
  def index
    @specials = Special.all
  end
# post/Specials
  def create
    @special = Special.new special_params
    if @special.save
      flash[:success] = ["Special was added "]
      redirect_to bar_path
        else
        render :new
      end
    end

#get/special/new
  def new
    @bar = Bar.find(params[:bar_id])
    @special = @bar.specials.build
  end

  def edit
    @special = current_special
  end

  def show
    set_bar
    @special = current_special

  end

  def update
    @special =current_special
    if @special.update_attributes(params[:special])
      flash[:success] = "Special Updated"
      redirect_to @bar
    else
      render 'edit'
  end
end

  def destroy
    @special_price = current_special
    @special.destroy
    flash[:success] = "Special deleted"
    redirect_to bar_path
  end


private
  def set_bar
    @bar = Bar.find(params[:id])
  end

  def current_special
    @current_special || Special.find(params[:id]) if params[:id]

  end

  def special_params
    params.require(:special).permit(:special_description, :day, :special_price, :start_time, :end_time)

  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end # the real end
