class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :skin_type, :pic])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :skin_type, :pic]) 
    end
end
