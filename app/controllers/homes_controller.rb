class PlacesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin,  except: [:index, :show]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      flash[:success] = "The place #{@place.name} was added succesfully"
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
    # @fields = Field.all
    # @community_fields = @community.fields
    # @community_jobs = @community.jobs
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:success] = "The place #{@place.name} was updated succcessfully"
      redirect_to place_path(@place)
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:danger] = "Place deleted successfully."
    redirect_to places_path
  end


  private
  def place_params
    params.require(:place).permit(
      :name,
      :description,
      :main_image,
      :rating,
      :type,
      :place_type,
      :link,
      :price,
      :user_id,
      :full_address,
      :city_id,
      :longitude,
      :latitude,
      :is_free_wifi,
      :is_good_for_laptop,
      :is_free_entrance,
      :is_outlets_available,
      :is_whiteboard_available,
      :is_good_coffee,
      :is_nice_staff,
      :is_good_for_meetings,
      :is_good_location
    )
  end

  def require_admin
    if current_user && !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to places_path
    end
  end

  def require_same_user
    @place = Place.find(params[:id])
    if current_user != @place.user
      flash[:danger] = "You can't perform this action."
      redirect_to root_path
    end
  end
end