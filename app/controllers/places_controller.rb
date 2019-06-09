class PlacesController < ApplicationController

  def index
    @places = Place.paginate(page: params[:page])
  end
  
  def new
    @place = Place.new
  end

  def create  
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Your new place was created!"
      redirect_to places_path
    else 
      render 'new'
    end
  end
  
  def edit  
  end

  def update  
  end

  def destroy
  end

  private
  
  def place_params
    params.require(:place).permit(:name, :address, :website, :phone_number, :category)
  end


end
