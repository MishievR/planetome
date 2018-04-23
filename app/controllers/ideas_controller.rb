class IdeasController < ApplicationController

  # before_action :require_admin, except: [:index, :create, :put, :show]
  # before_action :authenticate_user!, except: [:index, :create, :put]

  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "Your idea was added!"
      redirect_to ideas_path
    else
      flash[:success] = "Wooops!"
    end
  end

  def destroy
    if current_user.admin?
      @idea = Idea.find(params[:id])
      @idea.destroy
      flash[:danger] = "Idea deleted successfully."
      redirect_to ideas_path
    else
      flash[:danger] = "You can't perform this action."
    end
  end

  def upvote
    if current_user.present?
      @idea = Idea.find(params[:id])
      @idea.upvote_by current_user
      redirect_to :back
    elsif
      flash[:danger] = "Please, sign up to upvote an idea and create your first project!"
      redirect_to new_user_registration_path
    end

  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_by current_user
    redirect_to :back
  end


  private
    def idea_params
      params.require(:idea).permit(:title)
    end


end
