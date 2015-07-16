class UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    login!(@user)
    flash[:notice] = "Successfully signed up!"
    redirect_to :show
  end

  def new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
