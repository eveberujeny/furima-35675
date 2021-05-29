class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :name_reading, :surname_reading, :nickname, :birthday])
  end
end
