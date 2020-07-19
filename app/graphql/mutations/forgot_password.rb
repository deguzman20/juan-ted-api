module Mutations
  # mutation for creating new user
  class ForgotPassword < BaseMutation
    description "Forgot Password"

    argument :email, String, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false
    field :email, String, null: false

    def resolve(email: nil)
      forgot_password = ForgotPasswordService.call(email)
      { response: forgot_password, status_code: 200 }
    end
  end
end
