class UpdatesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project

  def index
    @updates = Update.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @update = Update.find(params[:id])
  end

  # GET /projects/new
  def new
    @update = Update.new

  end

  # GET /projects/1/edit
  def edit
    @update = Update.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
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

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @update = Update.find(params[:id])
    if @update.update(update_params)
      flash[:success] = "Update was updated succcessfully"
      redirect_to @project
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    # @project = Project.find(params[:project_id])

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


end
