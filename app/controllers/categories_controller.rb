class CategoriesController < ApplicationController


    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category was created succesfully"
        redirect_to categories_path
      else
        render 'new'
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def show
      @category = Category.find(params[:id])
      # @community_fields = @field.communities
      @job_categories = @category.jobs

    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:success] = "Category was updated succcessfully"
        redirect_to category_path(@category)
      else
        render 'edit'
      end
    end


    private
    def category_params
      params.require(:category).permit(
        :title,
        :about,
        :background)
    end

    def require_admin
      if user_signed_in? and !current_user.admin?
        flash[:danger] = "Only admins can perform that action"
        redirect_to employers_path
      end
    end



end