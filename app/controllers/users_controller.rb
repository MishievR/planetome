class UsersController < ApplicationController

  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
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
    params.require(:user).permit(:first_name, :last_name, :avatar, :background, :email, :admin, :about, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform this action"
    end
  end



end
