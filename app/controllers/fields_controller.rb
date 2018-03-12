class FieldsController < ApplicationController
  before_action :require_admin, except: [:index, :show]


  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    if @field.save
      flash[:success] = "Field was created succesfully"
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
  end

  def update
    @field = Field.find(params[:id])
    if @field.update(field_params)
      flash[:success] = "Field was updated succcessfully"
      redirect_to field_path(@field)
    else
      render 'edit'
    end
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
