class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_community

  def index
    @posts = Post.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /projects/new
  def new
    @post = Post.new

  end

  # GET /projects/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create

    @post = Post.new(post_params)

    @post.user = current_user
    @post.community = @community
    if @post.save
      flash[:success] = "Post was created succesfully"
      redirect_to @community
    else
      render 'new'
    end

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post was updated succcessfully"
      redirect_to @community
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    # @project = Project.find(params[:project_id])

    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = "Post deleted successfully."
    redirect_to @community
  end


  private

  def set_community
    @community = Community.find(params[:community_id])
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end


end
