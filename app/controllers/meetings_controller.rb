class MeetingsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  before_action :authenticate_user!, except: [:index, :put]

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.meeting_from = current_user
    if @meeting.save
      @topic = Topic.find(@meeting.main_topic_id)
      @meeting_user = @topic.user.first_name
      flash[:success] = "Your meeting invite was sent to #{@meeting_user}!"
      # from = Email.new(email: 'mr.mishiev@gmail.com')
      # to = Email.new(email: 'roman@planetome.com')
      # subject = 'Sending with SendGrid is Fun'
      # content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
      # mail = Mail.new(from, subject, to, content)
      #
      # sg = SendGrid::API.new(api_key: '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')
      # response = sg.client.mail._('send').post(request_body: mail.to_json)
      # puts response.status_code
      # puts response.body
      # puts response.headers

      redirect_to root_path
    else
      flash[:success] = "Wooops!"
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(:meeting_with, :meeting_from, :main_topic_id, :meeting_time, :meeting_comment, place_ids: [])
    end

end
