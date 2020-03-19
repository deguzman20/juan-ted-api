class TaskerAuthenticationService < ApplicationService
  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    authenticate_tasker
  end

  private

    def authenticate_tasker
      tasker = Tasker.find_for_authentication(email: email)
      return nil unless tasker

      is_valid_for_auth = tasker.valid_for_authentication? do
        tasker.valid_password?(password)
      end

      return unless is_valid_for_auth

      get_tasker = Tasker.find_by_email(email)
      if get_tasker.auth_token.nil?
        token = JsonWebToken.encode(tasker_id: tasker.id)
        get_tasker.auth_token = token
        get_tasker.save!
        JsonWebToken.decode(token)
        get_tasker.auth_token
      else
        token = get_tasker.auth_token
        case JsonWebToken.decode(token)
        when "expired_token"
          token = JsonWebToken.encode(tasker_id: tasker.id)
          get_tasker.auth_token = token
          get_cutomer.save!
          JsonWebToken.decode(token)
          get_tasker.auth_token
        when "decode_error"
          "decode_error"
        else
          get_tasker.auth_token
        end
      end
    end
end
