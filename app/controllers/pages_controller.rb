class PagesController < ApplicationController

  def index
    @users = User.all
    @fields = Field.all
    @cities = City.all
    @communities = Community.all
    @idea = Idea.new
    @jobs = Job.all
    @categories = Category.all

  end

end
