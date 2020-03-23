module Mutations
  # mutation for sign in user
  class SignInCustomer < BaseMutation
    description "Sign-in Authentication for customer"
    argument :email, Types::AuthProviderEmailInput, required: false
    field :email, String, null: true
    type Types::CustomerType


    def resolve(email: nil)
      CustomerAuthenticationService.call(email[:email], email[:password])
    end
  end
end
