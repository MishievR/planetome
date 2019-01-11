class HomesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin,  except: [:index, :show]

  def index
    @homes = Home.all
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      flash[:success] = "The home #{@home.name} was added succesfully"
      redirect_to home_path(@home)
    else
      render 'new'
    end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def show
    @home = Home.find(params[:id])
    # @fields = Field.all
    # @community_fields = @community.fields
    # @community_jobs = @community.jobs
  end

  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      flash[:success] = "The home #{@home.name} was updated succcessfully"
      redirect_to home_path(@home)
    else
      render 'edit'
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    flash[:danger] = "Home deleted successfully."
    redirect_to homes_path
  end


  private
  def home_params
    params.require(:home).permit(
      :name,
      :about,
      :features,
      :capacity,
      :main_photo,
      :other_photo,
      :video_url,
      :home_type,
      :full_address,
      :city_id,
      :user_id
    )
  end

  def require_admin
    if current_user && !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to homes_path
    end
  end

  def require_same_user
    @home = Home.find(params[:id])
    if current_user != @home.user
      flash[:danger] = "You can't perform this action."
      redirect_to root_path
    end
  end
end
