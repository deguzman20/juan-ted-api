class ForgotPasswordService < ApplicationService
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def call
    forgot_password
  end

  private

    def forgot_password
      @customer = Customer.find_by_email(email)
      return nil unless @customer.present?
      puts ForgotPasswordMailer.forgot_password(@customer).deliver!
    end
end
