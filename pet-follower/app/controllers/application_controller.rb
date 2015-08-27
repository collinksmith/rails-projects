class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def verify_login
    unless logged_in?
      flash[:errors] = ["You must log in to create or edit pets."]
      redirect_to pets_url
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    # fetches the user we've logged in as
    return nil if self.session[:session_token].nil?
    @user ||= User.find_by(session_token: self.session[:session_token])
  end

  def log_in!(user)
    # force other clients to log out by regenerating token
    user.reset_session_token!
    # log this client in
    self.session[:session_token] = user.session_token
  end

  def log_out!
    self.session[:session_token] = nil
  end
end
