class UserMailer < ApplicationMailer
  default from: "musicapp@example.com"

  def welcome_email(user)
    @user = user
    @url = new_session_url

    mail(to: user.email, subject: "Welcome to Music App!")
  end
end
