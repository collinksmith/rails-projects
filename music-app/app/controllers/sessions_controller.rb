class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])
    

    if @user && activated?(@user)
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid credentials" if activated?(@user)
      render :new
    end
  end

  def destroy
    @user = current_user
    logout!(@user)

    flash[:notice] = "Logged out"

    redirect_to new_session_url
  end

  private

  def activated?(user)
    unless user.activated
      flash.now[:errors] = "You can't log in until you activate your account!"
      return false
    end
    true
  end
end
