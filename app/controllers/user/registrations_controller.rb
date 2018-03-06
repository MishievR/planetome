class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters


  protected

  def after_sign_up_path_for(resource)
    edit_user_path(current_user)
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
