class CitiesController < ApplicationController

before_action :require_admin, except: [:index, :show]


def index
  @cities = City.all
end

def new
  @city = City.new
end

def create
  @city = City.new(city_params)
  if @city.save
    flash[:success] = "City was created succesfully"
    redirect_to cities_path
  else
    render 'new'
  end
end

def edit
  @city = City.find(params[:id])
end

def show
  @city = City.find(params[:id])
end

def update
  @city = City.find(params[:id])
  if @city.update(city_params)
    flash[:success] = "City was updated succcessfully"
    redirect_to city_path(@city)
  else
    render 'edit'
  end
end



private
def city_params
  params.require(:city).permit(:name, :country, :background, :rating)
end

def require_admin
  if user_signed_in? and !current_user.admin?
    flash[:danger] = "Only admins can perform that action"
    redirect_to cities_path
  end
end


end
