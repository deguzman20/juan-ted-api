class ForgotPasswordMailer < ApplicationMailer
  default from: "from@example.com"

  def forgot_password(user)
    @user = user
    mail(to: @user.email, subject: "Forgot Password")
  end
end
