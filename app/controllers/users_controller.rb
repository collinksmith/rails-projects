class UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    login!(@user)
    flash[:notice] = "Successfully signed up!"
    redirect_to user_url(@user)
  end

  def new
    render :new
  end

  def show
    @user = current_user

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
