class UpdatesController < ApplicationController

  before_action :require_same_user, except: [:new, :create]
  before_action :authenticate_user!
  before_action :set_project

  def index
    @updates = Update.all
  end


  def show
    @update = Update.find(params[:id])
  end

  def new
    @update = Update.new
  end

  def edit
    @update = Update.find(params[:id])
  end

  def create
    @update = Update.new(update_params)
    @update.project = @project
    if @update.save
      flash[:success] = "Update was created succesfully"
      redirect_to @project
    else
      render 'new'
    end

  end

  def update
    @update = Update.find(params[:id])
    if @update.update(update_params)
      flash[:success] = "Update was updated succcessfully"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @update = Update.find(params[:id])
    @update.destroy
    flash[:danger] = "Update deleted successfully."
    redirect_to @project
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end


  def update_params
    params.require(:update).permit(:name, :description)
  end

  def require_same_user
    @update = Update.find(params[:id])
    if current_user != @update.project.user
      flash[:danger] = "You can't perform this action."
      redirect_to root_path
    end
  end

end
