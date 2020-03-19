class CustomerAuthenticationService < ApplicationService
  attr_accessor :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    authenticate_customer
  end

  private

    def authenticate_customer
      customer = Customer.find_for_authentication(email: email)
      return nil unless customer

      is_valid_for_auth = customer.valid_for_authentication? do
        customer.valid_password?(password)
      end

      return unless is_valid_for_auth

      get_customer = Customer.find_by_email(email)
      if get_customer.auth_token.nil?
        token = JsonWebToken.encode(customer_id: customer.id)
        get_customer.auth_token = token
        get_customer.save!
        JsonWebToken.decode(token)
        get_customer.auth_token
      else
        token = get_customer.auth_token
        case JsonWebToken.decode(token)
        when "expired_token"
          token = JsonWebToken.encode(customer_id: customer.id)
          get_customer.auth_token = token
          get_customer.save!
          JsonWebToken.decode(token)
          get_customer.auth_token
        when "decode_error"
          "decode_error"
        else
          get_customer.auth_token
        end
      end
      # end
    end
end
