class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #load_and_authorize_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "Acceso Denegado"
  end
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar])
  end

end
