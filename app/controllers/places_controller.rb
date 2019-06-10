class PlacesController < ApplicationController

  def index
    @places = Place.all
  end
  
  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
    #@reviews = @user.reviews.paginate(page: params[:page])
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
    @place = Place.find(params[:id])
  end

  def update  
  end

  def destroy
  end

  private
  
  def place_params
    params.require(:place).permit(:name, :address, :website, :phone_number, :category, :changing_tables, :nursing_room, :high_chairs, :family_bathroom)
  end


end
