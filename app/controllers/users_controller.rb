class UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    @user.generate_activation_token!
    login!(@user)
    flash[:notice] = "Successfully signed up!"
    
    msg = UserMailer.welcome_email(@user)
    msg.deliver

    redirect_to user_url(@user)
  end

  def new
    render :new
  end

  def show
    @user = current_user

    render :show
  end

  def activate
    token = params[:activation_token]
    @user = User.find_by(activation_token: token)

    if @user && @user.activated == false
      @user.toggle!(:activated)
      flash[:notice] = "Account activated!"
    end

    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
