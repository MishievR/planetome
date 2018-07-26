class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def require_user
  if !user_signed_in?
    flash[:danger] = "You must be logged in to perform that action"
    redirect_to root_path
  end
end

def after_sign_in_path_for(resource)
  root_path
end

end
