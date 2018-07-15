class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  require 'sendgrid-ruby'
  include SendGrid
  def create
    super do |resource|
      if resource.save
        from = Email.new(email: 'roman.mishiev@gmail.com')
        to = Email.new(email: resource.email)
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: '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')
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
      end
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_user_path(current_user)
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
