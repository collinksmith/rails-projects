class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])

    if user
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy!

    render json: user
  end

  def favorites
    favorites = Contact.where(user_id: params[:id], favorite: true)
    favorites += ContactShare.where(user_id: params[:id], favorite: true)

    render json: favorites
  end

  def group_contacts
    user = User.find(params[:id])
    group_contacts = user.group_contacts

    render json: group_contacts
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
