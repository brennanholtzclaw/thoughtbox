class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def unauthenticated_user
    redirect_to welcome_path unless current_user
  end
end
