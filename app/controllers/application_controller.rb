class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user, :logged_in?
  before_action :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  private
  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  def check_signed_in
    if logged_in?
      if current_user.chef?
        redirect_to chef_home_path
      else
        redirect_to user_home_path
      end
    end
  end
end
