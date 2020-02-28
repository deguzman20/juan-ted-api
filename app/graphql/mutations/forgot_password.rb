module Mutations
  # mutation for creating new user
  class ForgotPassword < BaseMutation
    description "Forgot Password"

    # base input object for email and password
    # class ForgotPasswordData < Types::BaseInputObject
    #   argument :email, Types::AuthProviderEmailInput, required: false
    # end

    argument :email, String, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false
    field :email, String, null: false

    def resolve(email: nil)
      forgot_password = ForgotPasswordService.call(email)
      { response: forgot_password, status_code: 200 }
      # if forgot_password.present?
      #   { response: "Successful", status_code: 200 }
      # else
      #   { response: "Undefined"), status_code: 422 }
      # end
    end
  end
end
