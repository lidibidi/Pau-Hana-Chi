class SpecialsController < ApplicationController

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
    @special = Special.new
  end

  def edit
    @special = current_special
  end

  def show
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

  def current_special
    @current_special || Special.find(params[:id]) if params[:id]

  end

  def special_params
    params.require(:special).permit(:special_description, :day, :special_price, :start_time, :end_time)

  end
end # the real end
