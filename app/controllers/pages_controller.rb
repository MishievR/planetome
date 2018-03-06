class PagesController < ApplicationController
  def index
    @users = User.all
    @fields = Field.all
    @cities = City.all
    @communities = Community.all
  end
end
