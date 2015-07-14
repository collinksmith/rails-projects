class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    contacts = user.shared_contacts
    contacts += Contact.where(user_id: params[:user_id])

    render json: contacts
  end

  def show
    contact = Contact.find(params[:id])

    if contact
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])

    contact.destroy!

    render json: contact
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :name, :email, :favorite)
  end
end
