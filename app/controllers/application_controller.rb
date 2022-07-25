class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  before_action :check_subdomain

  def check_subdomain
    if current_user != nil
      unless request.subdomain == current_user.domain
        request.session_options[:skip] = true
      end
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :name, :email, :password, :password_confirmation, :domain, :role, :id_school)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :name, :email, :password, :current_password, :domain, :role, :id_school)}
  end
end
