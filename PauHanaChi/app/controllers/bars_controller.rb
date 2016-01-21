class BarsController < ApplicationController
  before_action :load_user, :set_bar, only: [:show, :edit, :update, :destroy]


  def index
    @bars = Bar.all
  end

  def create
    @bar = Bar.new (bar_params)

    respond_to do |format|
    if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was succesfully added.'}
        format.json { redirect_to :show, status: :created, location: @bar }
      else
        format.html { render :new }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @bar = Bar.new
  end

  def edit
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def update
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to :back
  end

private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:bar_name, :address, :city, :zipcode, :neighborhood, :phone, :website)
  end
end #the real end
