class TopicsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end


  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      flash[:success] = "Your topic was added!"
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

      redirect_to topic_path(@topic)
    else
      flash[:success] = "Wooops!"
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:success] = "The topic #{@topic.name} was updated succcessfully"
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.admin?
      @topic = Topic.find(params[:id])
      @topic.destroy
      flash[:danger] = "Topic deleted successfully."
      redirect_to topics_path
    else
      flash[:danger] = "You can't perform this action."
    end
  end


  private
    def topic_params
      params.require(:topic).permit(:title, :description, :user_id)
    end

    def require_same_user
      @topic = Topic.find(params[:id])

        if current_user != @topic.user
          flash[:danger] = "You can only edit your own topic."
          redirect_to root_path
        end



    end

end
