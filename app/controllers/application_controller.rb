class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  protected
  # Set the locale from parameters
  def set_locale
    I18n.locale = params[:locale] unless params[:locale].blank?
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
  
  def authenticate
    logged_in? ? true : access_denied
  end
  
  def logged_in?
    current_user.is_a? User
  end
  
  helper_method :logged_in?
  
  def access_denied
    redirect_to(login_path, :notice => t("application.access_denied")) and return false
  end
end
