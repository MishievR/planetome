class ProjectsController < ApplicationController

  before_action :require_same_user, only: [:destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_permission, except: [:index, :new, :create]

  def index
    @projects = Project.where(:is_public => false)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @update = Update.new
    if user_signed_in? && current_user == @project.user
      @user_projects = Project.where(:user => current_user)
    else
      @user_projects = Project.where(:user => @project.user, :is_public => false)
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create

    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:success] = "Project was created succesfully"
      redirect_to @project
    else
      render 'new'
    end

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project was updated succcessfully"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.user = current_user
      @project = Project.find(params[:id])
      @updates = @project.updates.all
      @updates.destroy_all
      @project.destroy
      flash[:danger] = "Project and updates was deleted successfully."
      redirect_to @project
    else
      flash[:success] = "You can't perform this action."
    end

  end

  def upvote
    if current_user.present?
      @project = Project.find(params[:id])
      @project.upvote_by current_user
      redirect_back(fallback_location: root_path)
    elsif
      flash[:danger] = "Please, sign up to upvote this project and create your oun first project!."
      redirect_to new_user_registration_path
    end

  end



  private
  def project_params
    params.require(:project).permit(:name, :description, :is_public, :image, field_ids: [])
  end

  def require_same_user
    @project = Project.find(params[:id])
    if @project.user != current_user
      flash[:danger] = "You can't perform this action."
      redirect_back(fallback_location: root_path)
    end
  end

  def check_permission
    @project = Project.find(params[:id])
    if @project.is_public == true
      if @project.user != current_user
        flash[:danger] = "You can't perform this action."
        redirect_back(fallback_location: root_path)
      end
    end
  end

end
