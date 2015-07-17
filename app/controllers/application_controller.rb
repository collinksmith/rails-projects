class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= user.find(session_token: session[:session_token])
  end

  def log_in!(user)
    user.reset_session_token!
  end

  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
end
