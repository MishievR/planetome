class IdeasController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid
  # before_action :require_admin, except: [:index, :create, :put, :show]
  before_action :authenticate_user!, except: [:index, :put]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end


  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      flash[:success] = "Your news was added!"
      from = Email.new(email: 'mr.mishiev@gmail.com')
      to = Email.new(email: 'roman@planetome.com')
      subject = 'Sending with SendGrid is Fun'
      content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
      mail = Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: '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')
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers

      redirect_to root_path
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
      redirect_to new_user_session_path
    end

  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_by current_user
    redirect_to :back
  end


  private
    def idea_params
      params.require(:idea).permit(:title, :link)
    end


end
