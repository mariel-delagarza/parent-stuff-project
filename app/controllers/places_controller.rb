class PlacesController < ApplicationController

  def index
    @places = Place.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @places, status: 200 }
    end 
    #render json: @places
  end
  
  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
    #@reviews = @user.reviews.paginate(page: params[:page])
    #render json: @place '
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @place, status: 200 }
    end 
  end

  def create  
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Your new place was created!"
      #respond_to do |format| 
       # format.html {redirect_to places_path}
       # format.json {render json: @place}
      #end 
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
