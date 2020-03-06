# authorize api request service
class AuthorizeApiRequestService < ApplicationService
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    decoded_auth_token
  end

  private

    attr_reader :headers

    def user
      @user ||= Customer.find(decoded_auth_token[:customer_id].to_i) if decoded_auth_token
      @user ||= Tasker.find(decoded_auth_token[:tasker_id].to_i) if decoded_auth_token
      @user ||= errors.add(:token, "Invalid token") && nil
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      token = headers["Authorization"]
      token.split(" ").last if token.present?
    end
end
