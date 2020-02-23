# Library for jwt
class JsonWebToken
  class << self
    # include V1Base
    def encode(payload, exp = 1.day.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::VerificationError => _e
      "expired_token"
    rescue JWT::DecodeError, JWT::VerificationError => _e
      "decode_error"
    end
  end
end
