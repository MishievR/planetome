class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @users = User.all
    @fields = Field.all
    @cities = City.all
    @communities = Community.all
    flash[:success] = "We are in index idea"

    @idea = Idea.new

  end

  def new
    flash[:success] = "We are in new!"
    @idea = Idea.new
  end

  def create
    flash[:success] = "We are in create!"

    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "Done!"
      redirect_to ideas_path
    else
      flash[:success] = "Not done!"
    end
  end


  private
  def idea_params
    params.permit(:title)
  end


end
