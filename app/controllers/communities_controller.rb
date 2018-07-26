class CommunitiesController < ApplicationController

  before_action :require_admin,  except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.user = current_user
    if @community.save
      flash[:success] = "The community #{@community.name} was created succesfully"
      redirect_to community_path(@community)
    else
      render 'new'
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def show
    @community = Community.find(params[:id])
    @fields = Field.all
    @community_fields = @community.fields
    @community_jobs = @community.jobs
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      flash[:success] = "The community #{@community.name} was updated succcessfully"
      redirect_to community_path(@community)
    else
      render 'edit'
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    flash[:danger] = "Community deleted successfully."
    redirect_to communities_path
  end


  private
  def community_params
    params.require(:community).permit(
      :name,
      :description,
      :background,
      :rating,
      field_ids: [],
      job_ids: [])
  end

  def require_admin
    if current_user && !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to communities_path
    end
  end

  def require_same_user
    @community = Community.find(params[:id])
    if current_user != @community.user
      flash[:danger] = "You can't perform this action."
      redirect_to root_path
    end
  end
end
