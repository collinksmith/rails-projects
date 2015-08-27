class UserMailer < ApplicationMailer
  default from: "musicapp@example.com"

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/users/activate?activation_token=#{user.activation_token}"

    mail(to: user.email, subject: "Welcome to Music App!")
  end
end
