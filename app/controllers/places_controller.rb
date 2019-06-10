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
    @place = Place.find(params[:id])
    if @place.update_attributes(place_params)
      flash[:success] = "Place updated"
      redirect_to @place
    else 
      render 'edit'
    end
  end   

  def destroy 
    Place.find(params[:id]).destroy
    flash[:success] = "Place deleted!"
    redirect_to places_url
  end

  private
  
  def place_params
    params.require(:place).permit(:name, :address, :website, :phone_number, :category, :changing_tables, :nursing_room, :high_chairs, :family_bathroom)
  end


end
