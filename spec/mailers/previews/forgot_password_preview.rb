# Preview all emails at http://localhost:3000/rails/mailers/forgot_password
class ForgotPasswordPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/forgot_password/forgot_password
  def forgot_password
    ForgotPasswordMailer.forgot_password
  end
end
