class PagesController < ApplicationController

  def index
    @users = User.all
    @fields = Field.all
    @cities = City.all
    @communities = Community.all
    @idea = Idea.new
    @jobs = Job.all
    @categories = Category.all
    @ideas = Idea.all
    @places = Place.all
    @topics = Topic.all
    @homes = Home.all
    @projects = Project.all
  end

end
