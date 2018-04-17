class IdeasController < ApplicationController

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
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:danger] = "Idea deleted successfully."
    redirect_to ideas_path
  end

  private
    def idea_params
      params.require(:idea).permit(:title)
    end


end
