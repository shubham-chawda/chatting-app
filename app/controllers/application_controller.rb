class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  # helper_method :current_user

  # def current_user
  #   return @current_user if @current_user.present?
  #
  #   if session[:user_id].present?
  #     @current_user = User.find_by(id: session[:user_id])
  #   else
  #     @current_user = User.generate
  #     session[:user_id] = @current_user.id
  #     @current_user
  #   end
  #
  #   if @current_user.nil?
  #     @current_user = User.generate
  #     session[:user_id] = @current_user.id
  #     @current_user
  #   end
  #
  #   @current_user
  # end

end
