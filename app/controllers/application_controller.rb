class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
before_action :configure_permitted_parameters, if: :devise_controller?
helper_method :get_coords 

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
end

def after_sign_in_path_for(resource)
      users_profile_path(resource)
    end

def get_coords
	[current_user.latitude, current_user.longitude]
end

end
