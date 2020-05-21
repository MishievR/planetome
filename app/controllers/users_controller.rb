class UsersController < ApplicationController

  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy, :all]
  before_action :require_login

  def index
   @users = User.all
  end

  def all
    @users = User.all

  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all listings created by user have been deleted"
    redirect_to people_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :background, :email, :originnaly_from_city, :currently_in_city, :admin, :about, :username, :city_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      flash[:danger] = "Create your own account to perform this action."
      redirect_to new_user_registration_path
    end


  end

  def require_same_user
    @user = User.find(params[:id])
    if current_user != @user || current_user.admin = false
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


  def require_admin
    if user_signed_in?
      if current_user.admin != true
        flash[:danger] = "Only admin users can perform this action"
        redirect_to current_user
      end
    else
      flash[:danger] = "Only admin users can perform this action"
      redirect_to root_path
    end
  end

end
