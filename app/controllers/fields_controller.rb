class FieldsController < ApplicationController

  before_action :require_admin, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    if @field.save
      flash[:success] = "The field #{@field.name} was created succesfully"
      redirect_to fields_path
    else
      render 'new'
    end
  end

  def edit
    @field = Field.find(params[:id])
  end

  def show
    @field = Field.find(params[:id])
    @community_fields = @field.communities
    # @project_fields = @field.projects
  end

  def update
    @field = Field.find(params[:id])
    if @field.update(field_params)
      flash[:success] = "The field #{@field.name} was updated succcessfully"
      redirect_to field_path(@field)
    else
      render 'edit'
    end
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    flash[:danger] = "The field deleted successfully."
    redirect_to fields_path
  end


  private
  def field_params
    params.require(:field).permit(:name, :description, :background)
  end

  def require_admin
    if user_signed_in? and !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to fields_path
    end
  end


end
