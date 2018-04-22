class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @update = Update.new

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
      redirect_to current_user
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
    @project = Project.find(params[:id])
    @project.destroy
    flash[:danger] = "Project deleted successfully."
    redirect_to current_user
  end


  private
  def project_params
    params.require(:project).permit(:name, :description, :image, field_ids: [])
  end


end
